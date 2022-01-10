part of 'theme.dart';

/// Signature for the individual builders (`phone`, `tablet`, etc.).
typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
class ResponsiveLayoutBuilder extends StatelessWidget {
  /// {@macro responsive_layout_builder}
  const ResponsiveLayoutBuilder({
    Key? key,
    required this.phone,
    required this.laptop,
    this.tablet,
    this.desktop,
    this.child,
  }) : super(key: key);

  /// [ResponsiveLayoutWidgetBuilder] for phone layout.
  final ResponsiveLayoutWidgetBuilder phone;

  /// [ResponsiveLayoutWidgetBuilder] for tablet layout.
  final ResponsiveLayoutWidgetBuilder? tablet;

  /// [ResponsiveLayoutWidgetBuilder] for laptop layout.
  final ResponsiveLayoutWidgetBuilder laptop;

  /// [ResponsiveLayoutWidgetBuilder] for xLarge layout.
  final ResponsiveLayoutWidgetBuilder? desktop;

  /// Optional child widget which will be passed
  /// to the builders as a way to share/optimize shared layout.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= Breakpoints.phone) {
          return phone(context, child);
        }
        if (constraints.maxWidth <= Breakpoints.tablet) {
          return (tablet ?? laptop).call(context, child);
        }
        if (constraints.maxWidth <= Breakpoints.laptop) {
          return laptop(context, child);
        }

        return (desktop ?? laptop).call(context, child);
      },
    );
  }
}
