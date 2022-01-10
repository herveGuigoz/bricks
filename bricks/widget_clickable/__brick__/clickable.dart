import 'package:flutter/material.dart';

/// Makes the given [child] tappable and clickable.
class Clickable extends StatelessWidget {
  const Clickable({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  /// Child to be rendered
  final Widget child;

  /// Callback that notifies when the widget has been clicked or tapped
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
