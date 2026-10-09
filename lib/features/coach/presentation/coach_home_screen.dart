import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/providers/repository_providers.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/app_user.dart';
import '../../../domain/entities/chat_context.dart';
import '../../../domain/entities/chat_message.dart';
import '../../../domain/entities/chat_session.dart';
import '../../../domain/entities/daily_news.dart';
import '../../../domain/entities/micro_lesson.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/coach_avatar.dart';
import 'chat_session_notifier.dart';
import 'voice_session_notifier.dart';
import 'widgets/chat_message_bubble.dart';
import 'widgets/coach_input_bar.dart';
import 'widgets/daily_news_card.dart';
import 'widgets/paywall_overlay.dart';
import 'widgets/portfolio_mini_card.dart';
import 'widgets/quick_actions_bar.dart';
import 'widgets/voice_overlay.dart';
import '../../../core/theme/theme_provider.dart';

/// Главный экран «Coach» — самый важный экран приложения.
///
/// Сверху вниз: приветствие + аватар Coach, карточка
/// «Сегодня важно», Quick Actions, чат (First Launch /
/// сообщения), мини-карточка портфеля. Внизу — закреплённый
/// input-бар с круглой кнопкой микрофона (главный CTA).
///
/// Состояния: Loading (shimmer), Error (retry), No Internet
/// (пузырь-ошибка с retry), Limit Reached (мягкий paywall).
class CoachHomeScreen extends ConsumerStatefulWidget {
  const CoachHomeScreen({
    super.key,
    this.now,
    this.initialNews,
    this.initialLesson,
  });

  /// Время для приветствия (инжектится в тестах).
  final DateTime? now;

  /// Новость из ленты «Новости» (GoRouter extra) — авто-обсуждение.
  final DailyNews? initialNews;

  /// Микро-урок из «Обучения» (GoRouter extra) — авто-обсуждение.
  final MicroLesson? initialLesson;

  @override
  ConsumerState<CoachHomeScreen> createState() => _CoachHomeScreenState();
}

class _CoachHomeScreenState extends ConsumerState<CoachHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(analyticsServiceProvider).screen('coach_home');
    if (widget.initialNews != null) {
      _discussNews(widget.initialNews!);
    } else if (widget.initialLesson != null) {
      _discussLesson(widget.initialLesson!);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Обсуждение новости из карточки: вопрос + контекст `news`.
  void _discussNews(DailyNews news) {
    final l10n = AppLocalizations.of(context);
    ref
        .read(chatSessionProvider.notifier)
        .sendText(
          l10n.discussNewsQuestion(news.title),
          context: ChatContext(
            type: ChatContextType.news,
            newsId: news.id,
            newsTitle: news.title,
          ),
        );
  }

  /// Обсуждение микро-урока: вопрос + контекст `lesson`.
  void _discussLesson(MicroLesson lesson) {
    final l10n = AppLocalizations.of(context);
    ref
        .read(chatSessionProvider.notifier)
        .sendText(
          l10n.discussLessonQuestion(lesson.title),
          context: ChatContext(
            type: ChatContextType.lesson,
            lessonId: lesson.id,
            lessonTitle: lesson.title,
          ),
        );
  }

  /// Голосовой режим: вход в fullscreen-оверлей.
  ///
  /// Если дневной лимит Free исчерпан — мягкий paywall вместо оверлея.
  void _onVoiceTap() {
    final chat = ref.read(chatSessionProvider.notifier);
    if (chat.isPullLimitReached) {
      chat.enterLimitReached();
      return;
    }
    chat.enterVoiceMode();
    ref.read(voiceSessionProvider.notifier).start();
  }

  /// Выход из голосового режима: оверлей скрывается, сессия
  /// освобождает микрофон/синтезатор (авто-dispose провайдера).
  void _onVoiceClose() {
    ref.read(chatSessionProvider.notifier).exitVoiceMode();
  }

  Future<void> _onPaywallUpgrade() async {
    final service = ref.read(subscriptionServiceProvider);
    final success = await service.purchase(UserTier.newsPlus);
    if (success) {
      ref.read(chatSessionProvider.notifier).dismissLimitReached();
      ref.invalidate(subscriptionStatusProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(chatSessionProvider);
    final name =
        ref.watch(onboardingStateRepositoryProvider).currentUserName ?? '';
    final busy =
        session.phase == ChatSessionPhase.thinking ||
        session.phase == ChatSessionPhase.streaming ||
        session.phase == ChatSessionPhase.voice;

    // Автопрокрутка вниз при появлении нового сообщения.
    ref.listen(chatSessionProvider, (previous, next) {
      if (next.messages.length > (previous?.messages.length ?? 0) &&
          _scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });

    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.spaceMd,
                  AppDimensions.spaceMd,
                  AppDimensions.spaceMd,
                  104, // место под закреплённый input-бар
                ),
                children: [
                  _Header(greeting: _greeting(l10n, name), isOnline: true),
                  const SizedBox(height: AppDimensions.spaceLg),
                  DailyNewsCard(onDiscuss: _discussNews),
                  const SizedBox(height: AppDimensions.spaceLg),
                  QuickActionsBar(
                    questions: [
                      l10n.quickQ1,
                      l10n.quickQ2,
                      l10n.quickQ3,
                      l10n.quickQ4,
                    ],
                    onSend: (question) => ref
                        .read(chatSessionProvider.notifier)
                        .sendQuickAction(question),
                    isEnabled: !busy,
                  ),
                  const SizedBox(height: AppDimensions.spaceLg),
                  for (final message in session.messages)
                    ChatMessageBubble(
                      message: message,
                      onRetry: () =>
                          ref.read(chatSessionProvider.notifier).retryLast(),
                      onSuggestedReply: (question) => ref
                          .read(chatSessionProvider.notifier)
                          .sendSuggestedReply(question),
                    ),
                  // First Launch: пока нет сообщений —
                  // приветственное сообщение Coach.
                  if (session.isEmpty) _CoachWelcomeBubble(name: name),
                  const SizedBox(height: AppDimensions.spaceLg),
                  const PortfolioMiniCard(),
                ],
              ),
            ),
            if (session.phase == ChatSessionPhase.limitReached)
              PaywallOverlay(
                onUpgrade: _onPaywallUpgrade,
                onDismiss: () => ref
                    .read(chatSessionProvider.notifier)
                    .dismissLimitReached(),
              ),
            if (session.phase == ChatSessionPhase.voice)
              VoiceOverlay(onClose: _onVoiceClose),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CoachInputBar(onVoiceTap: _onVoiceTap),
            ),
          ],
        ),
      ),
    );
  }

  /// «Доброе утро / день / вечер, {имя}» по текущему часу.
  String _greeting(AppLocalizations l10n, String name) {
    if (name.isEmpty) return l10n.greetingFallback;
    final hour = (widget.now ?? DateTime.now()).hour;
    return switch (hour) {
      < 5 || >= 18 => l10n.greetingEvening(name),
      < 12 => l10n.greetingMorning(name),
      _ => l10n.greetingDay(name),
    };
  }
}

/// Шапка: приветствие + аватар Coach со статусом «Онлайн».
class _Header extends StatelessWidget {
  const _Header({required this.greeting, required this.isOnline});

  final String greeting;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            greeting,
            style: AppTextStyles.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppDimensions.spaceMd),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CoachAvatar(isOnline: isOnline),
            const SizedBox(height: AppDimensions.space2xs),
            Text(
              l10n.coachOnline,
              style: AppTextStyles.labelSmall.copyWith(
                color: context.palette.success,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Приветственное сообщение Coach при первом входе (First Launch).
class _CoachWelcomeBubble extends StatelessWidget {
  const _CoachWelcomeBubble({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ChatMessageBubble(
      message: ChatMessage(
        id: 'welcome',
        role: ChatRole.coach,
        text: l10n.coachFirstMessage(name),
        status: ChatMessageStatus.completed,
      ),
      onRetry: () {},
      onSuggestedReply: (question) {},
    );
  }
}
