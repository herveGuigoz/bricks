part of 'theme.dart';

class Typography extends TextTheme {
  Typography(Color primary)
      : base = TextStyle(
          // fontFamily: 'Your font family here',
          color: primary,
          fontWeight: AppFontWeight.regular,
          decoration: TextDecoration.none,
        );

  final TextStyle base;

  /// Headline 1 Text Style
  @override
  TextStyle get headline1 {
    return base.copyWith(
      fontSize: 56,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  @override
  TextStyle get headline2 {
    return base.copyWith(
      fontSize: 30,
      fontWeight: AppFontWeight.regular,
    );
  }

  /// Headline 3 Text Style
  @override
  TextStyle get headline3 {
    return base.copyWith(
      fontSize: 24,
      fontWeight: AppFontWeight.regular,
    );
  }

  /// Headline 4 Text Style
  @override
  TextStyle get headline4 {
    return base.copyWith(
      fontSize: 22,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Headline 5 Text Style
  @override
  TextStyle get headline5 {
    return base.copyWith(
      fontSize: 22,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Headline 6 Text Style
  @override
  TextStyle get headline6 {
    return base.copyWith(
      fontSize: 22,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Subtitle 1 Text Style
  @override
  TextStyle get subtitle1 {
    return base.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Subtitle 2 Text Style
  @override
  TextStyle get subtitle2 {
    return base.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Body Text 1 Text Style
  @override
  TextStyle get bodyText1 {
    return base.copyWith(
      fontSize: 18,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  @override
  TextStyle get bodyText2 {
    return base.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.regular,
    );
  }

  /// Caption Text Style
  @override
  TextStyle get caption {
    return base.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.regular,
    );
  }

  /// Overline Text Style
  @override
  TextStyle get overline {
    return base.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.regular,
    );
  }

  /// Button Text Style
  @override
  TextStyle get button {
    return base.copyWith(
      fontSize: 18,
      fontWeight: AppFontWeight.medium,
    );
  }

  TextTheme scale(double scaleFactor) {
    return TextTheme(
      headline1: headline1.copyWith(
        fontSize: headline1.fontSize! * _smallTextScaleFactor,
      ),
      headline2: headline2.copyWith(
        fontSize: headline2.fontSize! * _smallTextScaleFactor,
      ),
      headline3: headline3.copyWith(
        fontSize: headline3.fontSize! * _smallTextScaleFactor,
      ),
      headline4: headline4.copyWith(
        fontSize: headline4.fontSize! * _smallTextScaleFactor,
      ),
      headline5: headline5.copyWith(
        fontSize: headline5.fontSize! * _smallTextScaleFactor,
      ),
      headline6: headline6.copyWith(
        fontSize: headline6.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: subtitle1.copyWith(
        fontSize: subtitle1.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: subtitle2.copyWith(
        fontSize: subtitle2.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: bodyText1.copyWith(
        fontSize: bodyText1.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: bodyText2.copyWith(
        fontSize: bodyText2.fontSize! * _smallTextScaleFactor,
      ),
      caption: caption.copyWith(
        fontSize: caption.fontSize! * _smallTextScaleFactor,
      ),
      overline: overline.copyWith(
        fontSize: overline.fontSize! * _smallTextScaleFactor,
      ),
      button: button.copyWith(
        fontSize: button.fontSize! * _smallTextScaleFactor,
      ),
    );
  }
}
