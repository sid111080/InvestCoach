import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/chat_message.dart';
import '../../../../l10n/app_localizations.dart';

/// Пузырь сообщения в области чата.
///
/// Coach: surface-фон, подпись контекста (новость), состояния
/// «думает» / streaming / ошибка с retry, подсказки и bias
/// после финального ответа. Пользователь: emerald-фон справа.
class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.onRetry,
    required this.onSuggestedReply,
  });

  final ChatMessage message;

  /// Повтор последнего вопроса (пузырь в статусе failed).
  final VoidCallback onRetry;

  /// Тап по подсказке после ответа Coach.
  final ValueChanged<String> onSuggestedReply;

  /// Максимальная ширина пузыря (80% типичного экрана).
  static const double _maxBubbleWidth = 300;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceXs,
        horizontal: AppDimensions.space2xs,
      ),
      child: message.isCoach
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bubble(l10n),
                if (message.status == ChatMessageStatus.completed) ...[
                  if (message.suggestedReplies.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimensions.spaceXs,
                      ),
                      child: Wrap(
                        spacing: AppDimensions.spaceXs,
                        runSpacing: AppDimensions.spaceXs,
                        children: [
                          for (final reply in message.suggestedReplies)
                            _Chip(
                              label: reply,
                              onTap: () => onSuggestedReply(reply),
                            ),
                        ],
                      ),
                    ),
                  if (message.biasDetected.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimensions.spaceXs,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final bias in message.biasDetected)
                            _Chip(
                              label: l10n.biasChip(_prettifyBias(bias)),
                              color: AppColors.warning,
                              onTap: null,
                            ),
                        ],
                      ),
                    ),
                ],
              ],
            )
          : Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: _maxBubbleWidth,
                ),
                child: _bubble(l10n),
              ),
            ),
    );
  }

  Widget _bubble(AppLocalizations l10n) {
    final failed = message.status == ChatMessageStatus.failed;
    final isThinking = message.status == ChatMessageStatus.thinking;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: AppDimensions.spaceSm,
      ),
      decoration: BoxDecoration(
        color: message.isCoach
            ? (failed ? AppColors.errorContainer : AppColors.surface)
            : AppColors.primaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(AppDimensions.radiusMd),
          topRight: const Radius.circular(AppDimensions.radiusMd),
          bottomLeft: Radius.circular(
            message.isCoach ? 4 : AppDimensions.radiusMd,
          ),
          bottomRight: Radius.circular(
            message.isCoach ? AppDimensions.radiusMd : 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Подпись контекста: «О новости: …» (только у Coach).
          if (message.isCoach && message.context != null) ...[
            Text(
              l10n.aboutNews(
                message.context!.newsTitle ?? '',
              ),
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppDimensions.space2xs),
          ],
          if (isThinking)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: AppDimensions.spaceXs),
                Text(
                  l10n.chatThinking,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            )
          else
            Text(
              message.text,
              style: (message.isCoach
                      ? AppTextStyles.bodyMedium
                      : AppTextStyles.bodyMedium)
                  .copyWith(
                    color: message.isCoach
                        ? (failed
                            ? AppColors.onError
                            : AppColors.textPrimary)
                        : AppColors.onPrimaryContainer,
                  ),
            ),
          if (failed) ...[
            const SizedBox(height: AppDimensions.spaceXs),
            GestureDetector(
              onTap: onRetry,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.refresh,
                    size: 14,
                    color: AppColors.onError,
                  ),
                  const SizedBox(width: AppDimensions.space2xs),
                  Text(
                    l10n.retry,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.onError,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// `recency_bias` → `Recency bias` (человекочитаемый вид).
  String _prettifyBias(String bias) {
    final words = bias.split('_').where((word) => word.isNotEmpty);
    return words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onTap,
    this.color = AppColors.textPrimary,
  });

  final String label;
  final VoidCallback? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceSm,
          vertical: AppDimensions.spaceXs,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          border: Border.all(color: AppColors.outline),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: enabled ? color : AppColors.textSecondary,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
