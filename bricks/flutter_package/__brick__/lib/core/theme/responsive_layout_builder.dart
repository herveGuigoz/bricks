part of 'theme.dart';

/// Signature for the individual builders (`phone`, `tablet`, etc.).
typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder({
    Key? key,
    required this.phone,
    this.tablet,
    required this.laptop,
    this.child,
  }) : super(key: key);

  /// [ResponsiveLayoutWidgetBuilder] for phone layout.
  final ResponsiveLayoutWidgetBuilder phone;

  /// [ResponsiveLayoutWidgetBuilder] for tablet layout.
  final ResponsiveLayoutWidgetBuilder? tablet;

  /// [ResponsiveLayoutWidgetBuilder] for laptop layout.
  final ResponsiveLayoutWidgetBuilder laptop;

  /// Optional child widget which will be passed
  /// to the builders as a way to share/optimize shared layout.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;

        if (screenWidth <= Breakpoints.phone) {
          return phone(context, child);
        }
        if (screenWidth <= Breakpoints.tablet) {
          return (tablet ?? laptop).call(context, child);
        }
        if (screenWidth <= Breakpoints.laptop) {
          return laptop(context, child);
        }

        return laptop.call(context, child);
      },
    );
  }
}
