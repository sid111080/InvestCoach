import 'package:flutter/material.dart';

import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_provider.dart';
import '../utils/haptics.dart';

/// Вариант кнопки.
enum AppButtonVariant {
  /// Акцентная (Emerald) — primary CTA.
  primary,

  /// Нейтральная поверх surface.
  secondary,

  /// Прозрачная с рамкой.
  ghost,
}

/// Базовая кнопка InvestCoach.
///
/// Большие тап-таргеты, haptic feedback, мягкий scale-эффект
/// при нажатии (микровзаимодействия дизайн-системы).
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    this.icon,
    this.variant = AppButtonVariant.primary,
    this.onPressed,
    this.isLoading = false,
    this.expand = false,
  });

  final String label;
  final IconData? icon;
  final AppButtonVariant variant;
  final VoidCallback? onPressed;
  final bool isLoading;

  /// Распространяться на всю доступную ширину.
  final bool expand;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  );

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  bool get _enabled => widget.onPressed != null && !widget.isLoading;

  void _handleTapDown(TapDownDetails details) {
    if (!_enabled) return;
    _pressController.forward();
  }

  void _handleTapCancelOrUp() {
    _pressController.reverse();
  }

  void _handleTap() {
    if (!_enabled) return;
    Haptics.success();
    widget.onPressed!();
  }

  (Color, Color, Color?) get _palette => switch (widget.variant) {
        AppButtonVariant.primary => (
            context.palette.primary,
            context.palette.onPrimary,
            null,
          ),
        AppButtonVariant.secondary => (
            context.palette.surfaceElevated,
            context.palette.textPrimary,
            context.palette.outline,
          ),
        AppButtonVariant.ghost => (
            Colors.transparent,
            context.palette.primary,
            context.palette.outline,
          ),
      };

  @override
  Widget build(BuildContext context) {
    final (background, foreground, border) = _palette;
    return AnimatedBuilder(
      animation: _pressController,
      builder: (context, child) => Transform.scale(
        scale: 1 - 0.03 * _pressController.value,
        child: child,
      ),
      child: GestureDetector(
        onTapDown: _enabled ? _handleTapDown : null,
        onTapUp: _enabled ? (_) => _handleTapCancelOrUp() : null,
        onTapCancel: _enabled ? _handleTapCancelOrUp : null,
        onTap: _enabled ? _handleTap : null,
        child: Opacity(
          opacity: _enabled ? 1 : 0.45,
          child: Container(
            height: AppDimensions.minTapTarget,
            width: widget.expand ? double.infinity : null,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceXl,
            ),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              border: border == null
                  ? null
                  : Border.all(color: border),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: widget.expand
                  ? MainAxisSize.max
                  : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.isLoading)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: foreground,
                    ),
                  )
                else if (widget.icon != null) ...[
                  Icon(widget.icon, size: 20, color: foreground),
                  const SizedBox(width: AppDimensions.spaceXs),
                ],
                Flexible(
                  child: Text(
                    widget.label,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: foreground,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
