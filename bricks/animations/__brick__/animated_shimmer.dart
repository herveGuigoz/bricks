import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedShimmer extends AnimatedWidget {
  AnimatedShimmer({
    Key? key,
    required AnimationController listenable,
    this.child,
  })  : animation = CurvedAnimation(parent: listenable, curve: Curves.easeIn),
        super(key: key, listenable: listenable);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return _Shimmer(animation.value, child: child);
      },
      child: child,
    );
  }
}

class _Shimmer extends SingleChildRenderObjectWidget {
  const _Shimmer(
    this.animation, {
    Widget? child,
  }) : super(child: child);

  final double animation;

  @override
  _RenderShimmer createRenderObject(BuildContext context) {
    return _RenderShimmer(animation);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderShimmer renderObject) {
    renderObject._animation = animation;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('animValue', animation));
  }
}

class _RenderShimmer extends RenderProxyBox {
  _RenderShimmer(
    double animation, {
    bool alwaysIncludeSemantics = false,
    RenderBox? child,
  })  : _animation = animation,
        _alwaysIncludeSemantics = alwaysIncludeSemantics,
        super(child);

  static const angle = -math.pi / 5;
  static const double skeletonHeight = 50;

  double _animation;
  set animation(double value) {
    if (_animation != value) {
      _animation = value;
      markNeedsPaint();
    }
  }

  bool _alwaysIncludeSemantics;
  bool get alwaysIncludeSemantics => _alwaysIncludeSemantics;
  set alwaysIncludeSemantics(bool value) {
    if (value == _alwaysIncludeSemantics) return;
    _alwaysIncludeSemantics = value;
    markNeedsSemanticsUpdate();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    context.paintChild(child!, offset);

    final canvas = context.canvas;
    final bounds = child!.paintBounds;
    final height = bounds.height;
    final width = bounds.width;

    final diagonal = math.sqrt((width * width) + (height * height));
    final maxHeight = (diagonal * math.sin(angle)).abs() + bounds.height * 2;

    final painter = Paint()..color = Colors.white38;
    final rect = Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);

    canvas
      ..save()
      ..clipRect(rect)
      ..saveLayer(rect, painter)
      ..rotate(angle)
      ..translate(offset.dx, offset.dy)
      ..translate(0, maxHeight * _animation)
      ..drawRect(
        Rect.fromLTWH(-diagonal, -skeletonHeight, diagonal * 3, skeletonHeight),
        painter,
      )
      ..restore();
  }

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {
    if (child != null && alwaysIncludeSemantics) visitor(child!);
  }
}