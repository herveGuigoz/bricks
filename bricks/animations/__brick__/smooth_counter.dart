import 'package:flutter/material.dart';

class SmoothCounter extends ImplicitlyAnimatedWidget {
  const SmoothCounter({
    Key? key,
    required this.progress,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.easeOutCubic,
    this.style,
  }) : super(duration: duration, curve: curve, key: key);

  final double progress;
  final TextStyle? style;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _SmoothCounterState();
  }
}

class _SmoothCounterState extends AnimatedWidgetBaseState<SmoothCounter> {
  Tween<double?>? _progress;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progress = visitor(
      _progress,
      widget.progress,
      (dynamic value) => Tween<double>(begin: value as double?),
    ) as Tween<double?>?;
  }

  @override
  Widget build(BuildContext context) {
    final value = _progress?.evaluate(animation);
    return SizedBox(
      width: 70,
      child: Text(
        '${value != null ? value.toStringAsFixed(0) : '0'}%',
        style: widget.style,
      ),
    );
  }
}