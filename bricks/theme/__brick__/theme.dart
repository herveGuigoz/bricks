import 'package:flutter/material.dart';

part 'breakpoints.dart';
part 'colors.dart';
part 'font_weights.dart';
part 'responsive_layout_builder.dart';
part 'theme_data.dart';
part 'typography.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static const AppThemeData _kFallbackTheme = AppThemeData();

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return result?.data ?? _kFallbackTheme;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return oldWidget.data != data;
  }
}
