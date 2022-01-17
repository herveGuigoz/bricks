part of 'theme.dart';

/// A wrapper around [Gap] that renders a [phone], [tablet]
/// or a [laptop] gap depending on the screen size.
class ResponsiveGap extends StatelessWidget {
  const ResponsiveGap({
    Key? key,
    this.phone = 16,
    this.tablet = 24,
    this.laptop = 32,
  }) : super(key: key);

  /// A gap rendered on a small layout.
  final double phone;

  /// A gap rendered on a medium layout.
  final double tablet;

  /// A gap rendered on a large layout.
  final double laptop;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      phone: (_, __) => Gap(phone),
      tablet: (_, __) => Gap(tablet),
      laptop: (_, __) => Gap(laptop),
    );
  }
}
