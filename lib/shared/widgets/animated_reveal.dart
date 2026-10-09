import 'package:flutter/material.dart';

/// Плавное появление контента: fade + slide up.
///
/// Используется для карточек, секций и элементов, которые появляются
/// после загрузки или перехода. Длительность 300 мс, кривая easeOut.
class AnimatedReveal extends StatefulWidget {
  const AnimatedReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offset = const Offset(0, 0.08),
  });

  final Widget child;

  /// Задержка перед стартом анимации (для stagger-эффекта).
  final Duration delay;

  /// Относительное смещение (доля высоты виджета).
  final Offset offset;

  @override
  State<AnimatedReveal> createState() => _AnimatedRevealState();
}

class _AnimatedRevealState extends State<AnimatedReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _curve;
  late final Tween<Offset> _slide;
  late final Tween<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: widget.offset, end: Offset.zero);
    _fade = Tween<double>(begin: 0, end: 1);

    // Старт с задержкой (stagger).
    if (widget.delay > Duration.zero) {
      Future<void>.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade.animate(_curve),
      child: SlideTransition(
        position: _slide.animate(_curve),
        child: widget.child,
      ),
    );
  }
}

/// Stagger-обёртка: каждая карточка появляется с нарастающей задержкой.
class StaggeredReveal extends StatelessWidget {
  const StaggeredReveal({
    super.key,
    required this.children,
    this.stagger = const Duration(milliseconds: 60),
  });

  final List<Widget> children;
  final Duration stagger;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < children.length; i++)
          AnimatedReveal(
            delay: Duration(milliseconds: i * stagger.inMilliseconds),
            child: children[i],
          ),
      ],
    );
  }
}
