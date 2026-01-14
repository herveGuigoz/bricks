import 'dart:ui';

/// Extensions on [String].
extension StringExtensions on String {
  /// Convert a HEX value encoded (A)RGB string to a Dart Color.
  ///
  /// IF the resulting string cannot be parsed to a Color, is empty or null
  /// THEN fully opaque black color is returned ELSE the Color is returned.
  Color get toColor {
    if (this == '') return const Color(0xFF000000);
    var hexColor = replaceAll('#', '');
    hexColor = hexColor.replaceAll('0x', '');
    hexColor = hexColor.padLeft(6, '0');
    hexColor = hexColor.padLeft(8, 'F');
    final length = hexColor.length;
    return Color(int.tryParse('0x${hexColor.substring(length - 8, length)}') ?? 0xFF000000);
  }

  /// Capitalize the first letter in a string.
  String get capitalize {
    return (length > 1) ? this[0].toUpperCase() + substring(1) : toUpperCase();
  }

  /// Checks if string is a valid email
  bool get isEmail {
    return RegExp(
      r"^[a-zA-Z0-9.!#$%&\'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$",
    ).hasMatch(toLowerCase());
  }

  /// Checks if string is a valid https url
  bool get isWeb {
    return RegExp(
      r'((https?:\/\/)|(\/)|(..\/))(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?',
    ).hasMatch(this);
  }
}
