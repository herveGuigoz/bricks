import 'package:flutter/material.dart';

@immutable
class AppRadius extends ThemeExtension<AppRadius> {
  const AppRadius({
    // Used in gallery
    this.small = const Radius.circular(8),
    // Used in cards
    this.regular = const Radius.circular(10),
    // Used for inputText
    this.big = const Radius.circular(16),
  });

  final Radius small;
  final Radius regular;
  final Radius big;

  @override
  ThemeExtension<AppRadius> copyWith({
    Radius? small,
    Radius? regular,
    Radius? big,
  }) {
    return AppRadius(
      small: small ?? this.small,
      regular: regular ?? this.regular,
      big: big ?? this.big,
    );
  }

  @override
  ThemeExtension<AppRadius> lerp(
    ThemeExtension<AppRadius>? other,
    double t,
  ) {
    if (other is! AppRadius) {
      return this;
    }

    return AppRadius(
      small: Radius.lerp(small, other.small, t)!,
      regular: Radius.lerp(regular, other.regular, t)!,
      big: Radius.lerp(big, other.big, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppRadius &&
        other.small == small &&
        other.regular == regular &&
        other.big == big;
  }

  @override
  int get hashCode => small.hashCode ^ regular.hashCode ^ big.hashCode;
}
