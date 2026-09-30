import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';

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
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.primaryContainer],
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
                  color: AppColors.success,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.background,
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
