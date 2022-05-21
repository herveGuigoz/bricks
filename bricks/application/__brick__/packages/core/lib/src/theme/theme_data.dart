import 'package:core/src/theme/theme_radius.dart';
import 'package:core/src/theme/theme_spacing.dart';
import 'package:flutter/material.dart';

extension ThemeExtensions on ThemeData {
  AppSpacing get spacing => extension<AppSpacing>()!;
  AppRadius get radius => extension<AppRadius>()!;
}
