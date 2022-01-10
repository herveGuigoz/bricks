part of 'theme.dart';

const _smallTextScaleFactor = 0.80;

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
      textTheme: _textTheme,
    );
  }

  /// `ThemeData` for small screens.
  ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for medium screens.
  ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: Typography.headline1,
      headline2: Typography.headline2,
      headline3: Typography.headline3,
      headline4: Typography.headline4,
      headline5: Typography.headline5,
      headline6: Typography.headline6,
      subtitle1: Typography.subtitle1,
      subtitle2: Typography.subtitle2,
      bodyText1: Typography.bodyText1,
      bodyText2: Typography.bodyText2,
      caption: Typography.caption,
      overline: Typography.overline,
      button: Typography.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: Typography.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: Typography.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: Typography.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: Typography.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: Typography.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: Typography.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: Typography.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: Typography.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: Typography.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: Typography.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: Typography.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: Typography.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: Typography.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
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
