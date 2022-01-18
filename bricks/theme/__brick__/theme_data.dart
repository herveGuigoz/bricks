part of 'theme.dart';

const _smallTextScaleFactor = 0.80;

@immutable
class AppThemeData {
  const AppThemeData({
    required this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  final AppColor color;
  final BorderRadius borderRadius;

  Brightness get brightness => ThemeData.estimateBrightnessForColor(color);

  ThemeData get standard {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: color,
        backgroundColor: color.shade50,
        errorColor: AppColors.rose500,
        brightness: brightness,
      ),
      textTheme: typography,
    );
  }

  /// `ThemeData` for small screens.
  ThemeData get small {
    return standard.copyWith(
      textTheme: typography.scale(_smallTextScaleFactor),
    );
  }

  /// `ThemeData` for medium screens.
  ThemeData get medium {
    return standard.copyWith(
      textTheme: typography.scale(_smallTextScaleFactor),
    );
  }

  Typography get typography {
    final isDark = brightness == Brightness.dark;
    final color = isDark ? AppColors.white : AppColors.black;
    return Typography(color);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppThemeData &&
        other.color == color &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => color.hashCode ^ borderRadius.hashCode;
}
