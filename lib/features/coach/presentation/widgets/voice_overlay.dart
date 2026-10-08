import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/app_providers.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/chat_session.dart';
import '../../../../domain/entities/voice_session.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/voice_button.dart';
import '../voice_session_notifier.dart';
import '../../../../core/theme/theme_provider.dart';

/// Fullscreen-оверлей голосового режима (Voice-First).
///
/// Поверх главного экрана (затемнение). Показывает текущую фазу
/// голосовой сессии: слушание → обработка → озвучивание → готово,
/// либо сбой с retry. Круглая кнопка микрофона — тап, чтобы остановить.
class VoiceOverlay extends ConsumerWidget {
  const VoiceOverlay({super.key, required this.onClose});

  /// Выход из голосового режима (экран закрывает оверлей).
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(voiceSessionProvider);
    final notifier = ref.read(voiceSessionProvider.notifier);
    final isMock = !ref.watch(appConfigProvider).useRealServices;

    return Positioned.fill(
      child: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(color: context.palette.overlay),
          ),
          // Без flutter_animate: оверлей — ConsumerWidget, перестраивается
          // на каждой фазе, и fadeIn перезапускался бы на каждом rebuild
          // (в тестах pumpAndSettle бы не сходился). Появление — мгновенное.
          Material(
            color: Colors.transparent,
            child: SafeArea(
              child: Column(
                children: [
                  _VoiceHeader(isMock: isMock, onClose: onClose),
                  Expanded(
                    child: _VoiceBody(
                      session: session,
                      onStopListening: notifier.stopListening,
                      onStopSpeaking: notifier.stopSpeaking,
                      onAskAgain: notifier.askAgain,
                      onRetry: notifier.retry,
                      onClose: onClose,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Шапка оверлея: заголовок, (mock-подсказка) и кнопка закрытия.
class _VoiceHeader extends StatelessWidget {
  const _VoiceHeader({required this.isMock, required this.onClose});

  final bool isMock;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spaceLg,
                ),
                child: Text(
                  l10n.voiceStart,
                  style: AppTextStyles.titleLarge,
                ),
              ),
            ),
            _IconButton(
              icon: Icons.close,
              label: l10n.voiceClose,
              onTap: onClose,
            ),
          ],
        ),
        if (isMock)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.spaceLg,
              0,
              AppDimensions.spaceLg,
              AppDimensions.spaceXs,
            ),
            child: Text(
              l10n.voiceMockHint,
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}

/// Круглая иконка-кнопка (закрытие) с доступным тап-таргетом.
class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: AppDimensions.minTapTarget,
          height: AppDimensions.minTapTarget,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.palette.surface,
          ),
          child: Icon(icon, color: context.palette.textPrimary, size: 22),
        ),
      ),
    );
  }
}

/// Тело оверлея: переключается по фазе голосовой сессии.
class _VoiceBody extends StatelessWidget {
  const _VoiceBody({
    required this.session,
    required this.onStopListening,
    required this.onStopSpeaking,
    required this.onAskAgain,
    required this.onRetry,
    required this.onClose,
  });

  final VoiceSession session;
  final VoidCallback onStopListening;
  final VoidCallback onStopSpeaking;
  final VoidCallback onAskAgain;
  final VoidCallback onRetry;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceXl,
          vertical: AppDimensions.spaceLg,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: switch (session.phase) {
            VoiceSessionPhase.listening => _ListeningView(
                transcript: session.transcript,
                onStop: onStopListening,
              ),
            VoiceSessionPhase.processing => _ProcessingView(
                transcript: session.transcript,
              ),
            VoiceSessionPhase.speaking => _SpeakingView(
                text: session.responseText,
                onStop: onStopSpeaking,
              ),
            VoiceSessionPhase.done => _DoneView(
                text: session.responseText,
                suggestedReplies: session.suggestedReplies,
                onAskAgain: onAskAgain,
                onClose: onClose,
              ),
            VoiceSessionPhase.failed => _FailedView(
                failure: session.failure,
                onRetry: onRetry,
                onClose: onClose,
              ),
          },
        ),
      ),
    );
  }
}

/// Слушание: крупный микрофон + живой транскрипт + подсказка.
class _ListeningView extends StatelessWidget {
  const _ListeningView({required this.transcript, required this.onStop});

  final String transcript;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VoiceButton(onTap: onStop),
        const SizedBox(height: AppDimensions.spaceXl),
        Text(
          l10n.voiceListening,
          style: AppTextStyles.titleMedium,
        ),
        const SizedBox(height: AppDimensions.spaceMd),
        if (transcript.isNotEmpty)
          _TranscriptCard(text: transcript),
        const SizedBox(height: AppDimensions.spaceLg),
        Text(
          l10n.voiceTapToStop,
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}

/// Обработка: спиннер + вопрос.
class _ProcessingView extends StatelessWidget {
  const _ProcessingView({required this.transcript});

  final String transcript;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 44,
          height: 44,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: context.palette.primary,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXl),
        Text(
          l10n.voiceProcessing,
          style: AppTextStyles.titleMedium,
        ),
        const SizedBox(height: AppDimensions.spaceMd),
        if (transcript.isNotEmpty) _TranscriptCard(text: transcript),
      ],
    );
  }
}

/// Озвучивание: текст ответа + микрофон (тап — остановить).
class _SpeakingView extends StatelessWidget {
  const _SpeakingView({required this.text, required this.onStop});

  final String text;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ResponseCard(text: text),
        const SizedBox(height: AppDimensions.spaceLg),
        Text(
          l10n.voiceSpeaking,
          style: AppTextStyles.titleMedium,
        ),
        const SizedBox(height: AppDimensions.spaceLg),
        VoiceButton(onTap: onStop),
        const SizedBox(height: AppDimensions.spaceLg),
        Text(
          l10n.voiceTapToStop,
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}

/// Готово: ответ + подсказки + «Спросить ещё» / «Закрыть».
class _DoneView extends StatelessWidget {
  const _DoneView({
    required this.text,
    required this.suggestedReplies,
    required this.onAskAgain,
    required this.onClose,
  });

  final String text;
  final List<String> suggestedReplies;
  final VoidCallback onAskAgain;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ResponseCard(text: text),
        if (suggestedReplies.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.spaceLg),
          Wrap(
            spacing: AppDimensions.spaceXs,
            runSpacing: AppDimensions.spaceXs,
            children: [
              for (final reply in suggestedReplies) _SuggestionPill(reply),
            ],
          ),
        ],
        const SizedBox(height: AppDimensions.spaceXl),
        AppButton(
          label: l10n.voiceAskAgain,
          icon: Icons.mic,
          expand: true,
          onPressed: onAskAgain,
        ),
        const SizedBox(height: AppDimensions.spaceXs),
        AppButton(
          label: l10n.voiceClose,
          variant: AppButtonVariant.ghost,
          expand: true,
          onPressed: onClose,
        ),
      ],
    );
  }
}

/// Сбой: сообщение + «Повторить» / «Закрыть».
class _FailedView extends StatelessWidget {
  const _FailedView({
    required this.failure,
    required this.onRetry,
    required this.onClose,
  });

  final ChatFailure? failure;
  final VoidCallback onRetry;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // «Микрофон недоступен» мапим на отдельную строку;
    // остальные сбои — готовый текст из error handler'а.
    final message = failure == null
        ? l10n.voiceMicUnavailable
        : failure!.errorCode == kMicUnavailableCode
        ? l10n.voiceMicUnavailable
        : failure!.userMessage;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: context.palette.error.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.error_outline,
            color: context.palette.error,
            size: 30,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceMd),
        Text(
          message,
          style: AppTextStyles.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.spaceXl),
        AppButton(
          label: l10n.retry,
          icon: Icons.refresh,
          expand: true,
          onPressed: onRetry,
        ),
        const SizedBox(height: AppDimensions.spaceXs),
        AppButton(
          label: l10n.voiceClose,
          variant: AppButtonVariant.ghost,
          expand: true,
          onPressed: onClose,
        ),
      ],
    );
  }
}

/// Карточка с распознанным вопросом.
class _TranscriptCard extends StatelessWidget {
  const _TranscriptCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.palette.outline),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Карточка с текстом ответа Coach.
class _ResponseCard extends StatelessWidget {
  const _ResponseCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(color: context.palette.outline),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodyLarge,
      ),
    );
  }
}

/// Чип-подсказка для продолжения разговора (в оверлее — статичный).
class _SuggestionPill extends StatelessWidget {
  const _SuggestionPill(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: AppDimensions.spaceXs,
      ),
      decoration: BoxDecoration(
        color: context.palette.primaryContainer,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        text,
        style: AppTextStyles.labelMedium.copyWith(
          color: context.palette.onPrimaryContainer,
        ),
      ),
    );
  }
}
