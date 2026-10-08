import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/theme/theme_provider.dart';


/// Shimmer-скелетон для состояния Loading.
///
/// [child] — «призрак» будущего контента (обычно AppCard
/// с серыми заставками нужной формы).
class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  final Widget child;

  /// Базовый цвет shimmer; если не задан — `surface` текущей темы.
  final Color? baseColor;

  /// Цвет блика; если не задан — `surfaceElevated` текущей темы.
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Shimmer.fromColors(
      baseColor: baseColor ?? palette.surface,
      highlightColor: highlightColor ?? palette.surfaceElevated,
      child: child,
    );
  }
}
