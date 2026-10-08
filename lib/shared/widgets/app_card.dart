import 'package:flutter/material.dart';

import '../../core/theme/app_dimensions.dart';
import '../../core/theme/theme_provider.dart';

/// Базовая карточка дизайн-системы: surface, мягкие тени,
/// скругление 16–24 dp (Calm Tech + Financial Trust).
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppDimensions.spaceMd),
    this.margin,
    this.radius = AppDimensions.radiusMd,
    this.color,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double radius;

  /// Цвет карточки; если не задан — `surface` текущей темы.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final card = Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? palette.surface,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: palette.outline),
        boxShadow: [
          BoxShadow(
            color: palette.shadow,
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
    if (onTap == null) return card;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: card,
    );
  }
}
