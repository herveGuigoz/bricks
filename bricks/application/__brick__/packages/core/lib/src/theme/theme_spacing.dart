import 'dart:ui' as ui show lerpDouble;

import 'package:flutter/material.dart';

@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    this.small = 8,
    this.regular = 16,
    this.big = 24,
  });

  final double small;
  final double regular;
  final double big;

  AppSpacing scale(double scaleFactor) {
    return copyWith(
      small: small * scaleFactor,
      regular: regular * scaleFactor,
      big: big * scaleFactor,
    );
  }

  @override
  AppSpacing copyWith({
    double? small,
    double? regular,
    double? big,
  }) {
    return AppSpacing(
      small: small ?? this.small,
      regular: regular ?? this.regular,
      big: big ?? this.big,
    );
  }

  @override
  ThemeExtension<AppSpacing> lerp(
    ThemeExtension<AppSpacing>? other,
    double t,
  ) {
    if (other is! AppSpacing) {
      return this;
    }

    return AppSpacing(
      small: ui.lerpDouble(small, other.small, t)!,
      regular: ui.lerpDouble(regular, other.regular, t)!,
      big: ui.lerpDouble(big, other.big, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppSpacing &&
        other.small == small &&
        other.regular == regular &&
        other.big == big;
  }

  @override
  int get hashCode => small.hashCode ^ regular.hashCode ^ big.hashCode;
}
