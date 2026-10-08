import 'package:flutter/material.dart';

import '../../core/theme/app_dimensions.dart';
import '../../core/theme/theme_provider.dart';

/// Аватар Coach со статусом «Онлайн».
///
/// Визуальный плейсхолдер: фактический арт Coach придёт из Figma
/// (спрайты/Lottie). Сейчас — градиентный круг и иконка.
class CoachAvatar extends StatelessWidget {
  const CoachAvatar({
    super.key,
    this.size = AppDimensions.coachAvatarSize,
    this.isOnline = true,
  });

  final double size;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [context.palette.primary, context.palette.primaryContainer],
              ),
            ),
            child: Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: size * 0.5,
            ),
          ),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: AppDimensions.statusDotSize,
                height: AppDimensions.statusDotSize,
                decoration: BoxDecoration(
                  color: context.palette.success,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.palette.background,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
