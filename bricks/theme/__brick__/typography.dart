part of 'theme.dart';

class Typography {
  static const TextStyle base = TextStyle(
    // fontFamily: 'Your font family here',
    color: AppColors.black,
    fontWeight: AppFontWeight.regular,
    decoration: TextDecoration.none,
  );

  /// Headline 1 Text Style
  static TextStyle headline1 = base.copyWith(
    fontSize: 56,
    fontWeight: AppFontWeight.medium,
  );

  /// Headline 2 Text Style
  static TextStyle headline2 = base.copyWith(
    fontSize: 30,
    fontWeight: AppFontWeight.regular,
  );

  /// Headline 3 Text Style
  static TextStyle headline3 = base.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.regular,
  );

  /// Headline 4 Text Style
  static TextStyle headline4 = base.copyWith(
    fontSize: 22,
    fontWeight: AppFontWeight.bold,
  );

  /// Headline 5 Text Style
  static TextStyle headline5 = base.copyWith(
    fontSize: 22,
    fontWeight: AppFontWeight.medium,
  );

  /// Headline 6 Text Style
  static TextStyle headline6 = base.copyWith(
    fontSize: 22,
    fontWeight: AppFontWeight.bold,
  );

  /// Subtitle 1 Text Style
  static TextStyle subtitle1 = base.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.bold,
  );

  /// Subtitle 2 Text Style
  static TextStyle subtitle2 = base.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.bold,
  );

  /// Body Text 1 Text Style
  static TextStyle bodyText1 = base.copyWith(
    fontSize: 18,
    fontWeight: AppFontWeight.medium,
  );

  /// Body Text 2 Text Style (the default)
  static TextStyle bodyText2 = base.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.regular,
  );

  /// Caption Text Style
  static TextStyle caption = base.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.regular,
  );

  /// Overline Text Style
  static TextStyle overline = base.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.regular,
  );

  /// Button Text Style
  static TextStyle button = base.copyWith(
    fontSize: 18,
    fontWeight: AppFontWeight.medium,
  );
}
