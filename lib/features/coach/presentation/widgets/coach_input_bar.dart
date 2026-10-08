import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/chat_session.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/voice_button.dart';
import '../chat_session_notifier.dart';
import '../../../../core/theme/theme_provider.dart';

/// Строка ввода чата: поле вопроса + круглая кнопка микрофона.
///
/// Микрофон — главный CTA (Voice-First). В Спринте 1 тап по нему
/// показывает snackbar; голосовой режим — Спринт 2.
class CoachInputBar extends ConsumerStatefulWidget {
  const CoachInputBar({super.key, required this.onVoiceTap});

  /// Тап по кнопке микрофона (в Спринте 1 — stub).
  final VoidCallback onVoiceTap;

  @override
  ConsumerState<CoachInputBar> createState() => _CoachInputBarState();
}

class _CoachInputBarState extends ConsumerState<CoachInputBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(chatSessionProvider);
    final busy = session.phase == ChatSessionPhase.thinking ||
        session.phase == ChatSessionPhase.streaming ||
        session.phase == ChatSessionPhase.voice;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.spaceMd,
        AppDimensions.spaceXs,
        AppDimensions.spaceMd,
        AppDimensions.space2xs,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spaceLg,
                vertical: AppDimensions.spaceSm,
              ),
              decoration: BoxDecoration(
                color: context.palette.surface,
                borderRadius:
                    BorderRadius.circular(AppDimensions.radiusFull),
                border: Border.all(color: context.palette.outline),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: context.palette.textPrimary,
                      ),
                      maxLines: 1,
                      enabled: !busy,
                      onSubmitted: (text) => _send(text),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: l10n.chatInputHint,
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: context.palette.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  if (busy)
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.palette.primary,
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: () => _send(_controller.text),
                      child: Container(
                        padding: const EdgeInsets.all(AppDimensions.space2xs),
                        child: Icon(
                          Icons.send,
                          size: 20,
                          color: _controller.text.trim().isEmpty
                              ? context.palette.textSecondary
                              : context.palette.primary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.spaceSm),
          VoiceButton(
            onTap: busy ? null : widget.onVoiceTap,
          ),
        ],
      ),
    );
  }

  void _send(String raw) {
    final text = raw.trim();
    if (text.isEmpty) return;
    _controller.clear();
    _focusNode.unfocus();
    ref.read(chatSessionProvider.notifier).sendText(text);
  }
}
