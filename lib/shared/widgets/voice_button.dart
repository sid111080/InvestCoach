import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/debug/debug_flags.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';

/// Круглая кнопка микрофона — главный CTA приложения (Voice-First).
///
/// Размер ~76 dp, ripple-анимация и haptic feedback.
/// В Спринте 1 это визуальный stub: анимация работает,
/// реальный voice-режим реализуют в Спринте 2.
class VoiceButton extends StatefulWidget {
  const VoiceButton({
    super.key,
    this.size = AppDimensions.voiceButtonSize,
    this.onTap,
  });

  final double size;
  final VoidCallback? onTap;

  @override
  State<VoiceButton> createState() => _VoiceButtonState();
}

class _VoiceButtonState extends State<VoiceButton>
    with SingleTickerProviderStateMixin {
  /// Периодическая ripple-анимация (дыхание кнопки).
  late final AnimationController _ripple = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  );

  @override
  void initState() {
    super.initState();
    // В widget-тестах бесконечная анимация не даёт pumpAndSettle
    // стабилизироваться — пульсацию не запускаем.
    if (!debugIsInFlutterTest) _ripple.repeat();
  }

  @override
  void dispose() {
    _ripple.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ripple,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Два расходящихся кольца с фазовым сдвигом.
            for (final phase in const [0.0, 0.5])
              Positioned(
                width: widget.size * (1 + 0.55 * _ringProgress(phase)),
                height: widget.size * (1 + 0.55 * _ringProgress(phase)),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary.withValues(
                        alpha: 0.5 * (1 - _ringProgress(phase)),
                      ),
                      width: 2,
                    ),
                  ),
                ),
              ),
            child!,
          ],
        );
      },
      child: GestureDetector(
        onTap: () {
          if (widget.onTap == null) return;
          HapticFeedback.mediumImpact();
          widget.onTap!();
        },
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, Color(0xFF15803D)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.45),
                blurRadius: 32,
                offset: const Offset(0, 12),
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            Icons.mic,
            color: AppColors.onPrimary,
            size: widget.size * 0.42,
          ),
        ),
      ),
    );
  }

  /// Прогресс кольца с учётом фазового сдвига.
  double _ringProgress(double phase) {
    final t = (_ripple.value + phase) % 1;
    return Curves.easeOut.transform(t);
  }
}
