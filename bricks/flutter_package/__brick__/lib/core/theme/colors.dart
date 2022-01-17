part of 'theme.dart';

/// From tailwindcss default color palette
/// https://tailwindcss.com/docs/customizing-colors
class AppColor extends MaterialColor {
  const AppColor(int primary, Map<int, Color> swatch) : super(primary, swatch);

  static const slate = AppColor(
    0xFF64748b,
    <int, Color>{
      50: AppColors.slate50,
      100: AppColors.slate100,
      200: AppColors.slate200,
      300: AppColors.slate300,
      400: AppColors.slate400,
      500: AppColors.slate500,
      600: AppColors.slate600,
      700: AppColors.slate700,
      800: AppColors.slate800,
      900: AppColors.slate900,
    },
  );

  static const gray = AppColor(
    0xFF6b7280,
    <int, Color>{
      50: AppColors.gray50,
      100: AppColors.gray100,
      200: AppColors.gray200,
      300: AppColors.gray300,
      400: AppColors.gray400,
      500: AppColors.gray500,
      600: AppColors.gray600,
      700: AppColors.gray700,
      800: AppColors.gray800,
      900: AppColors.gray900,
    },
  );

  static const zinc = AppColor(
    0xFF71717a,
    <int, Color>{
      50: AppColors.zinc50,
      100: AppColors.zinc100,
      200: AppColors.zinc200,
      300: AppColors.zinc300,
      400: AppColors.zinc400,
      500: AppColors.zinc500,
      600: AppColors.zinc600,
      700: AppColors.zinc700,
      800: AppColors.zinc800,
      900: AppColors.zinc900,
    },
  );

  static const neutral = AppColor(
    0xFF737373,
    <int, Color>{
      50: AppColors.neutral50,
      100: AppColors.neutral100,
      200: AppColors.neutral200,
      300: AppColors.neutral300,
      400: AppColors.neutral400,
      500: AppColors.neutral500,
      600: AppColors.neutral600,
      700: AppColors.neutral700,
      800: AppColors.neutral800,
      900: AppColors.neutral900,
    },
  );

  static const stone = AppColor(
    0xFF78716c,
    <int, Color>{
      50: AppColors.stone50,
      100: AppColors.stone100,
      200: AppColors.stone200,
      300: AppColors.stone300,
      400: AppColors.stone400,
      500: AppColors.stone500,
      600: AppColors.stone600,
      700: AppColors.stone700,
      800: AppColors.stone800,
      900: AppColors.stone900,
    },
  );

  // static const red = AppColor(
  //   0xFFef4444,
  //   <int, Color>{
  //     50: AppColors.red50,
  //     100: AppColors.red100,
  //     200: AppColors.red200,
  //     300: AppColors.red300,
  //     400: AppColors.red400,
  //     500: AppColors.red500,
  //     600: AppColors.red600,
  //     700: AppColors.red700,
  //     800: AppColors.red800,
  //     900: AppColors.red900,
  //   },
  // );

  static const orange = AppColor(
    0xFFf97316,
    <int, Color>{
      50: AppColors.orange50,
      100: AppColors.orange100,
      200: AppColors.orange200,
      300: AppColors.orange300,
      400: AppColors.orange400,
      500: AppColors.orange500,
      600: AppColors.orange600,
      700: AppColors.orange700,
      800: AppColors.orange800,
      900: AppColors.orange900,
    },
  );

  static const amber = AppColor(
    0xFFf59e0b,
    <int, Color>{
      50: AppColors.amber50,
      100: AppColors.amber100,
      200: AppColors.amber200,
      300: AppColors.amber300,
      400: AppColors.amber400,
      500: AppColors.amber500,
      600: AppColors.amber600,
      700: AppColors.amber700,
      800: AppColors.amber800,
      900: AppColors.amber900,
    },
  );

  static const yellow = AppColor(
    0xFFeab308,
    <int, Color>{
      50: AppColors.yellow50,
      100: AppColors.yellow100,
      200: AppColors.yellow200,
      300: AppColors.yellow300,
      400: AppColors.yellow400,
      500: AppColors.yellow500,
      600: AppColors.yellow600,
      700: AppColors.yellow700,
      800: AppColors.yellow800,
      900: AppColors.yellow900,
    },
  );

  static const lime = AppColor(
    0xFF84cc16,
    <int, Color>{
      50: AppColors.lime50,
      100: AppColors.lime100,
      200: AppColors.lime200,
      300: AppColors.lime300,
      400: AppColors.lime400,
      500: AppColors.lime500,
      600: AppColors.lime600,
      700: AppColors.lime700,
      800: AppColors.lime800,
      900: AppColors.lime900,
    },
  );

  // static const green = AppColor(
  //   0xFF22c55e,
  //   <int, Color>{
  //     50: AppColors.green50,
  //     100: AppColors.green100,
  //     200: AppColors.green200,
  //     300: AppColors.green300,
  //     400: AppColors.green400,
  //     500: AppColors.green500,
  //     600: AppColors.green600,
  //     700: AppColors.green700,
  //     800: AppColors.green800,
  //     900: AppColors.green900,
  //   },
  // );

  static const emerald = AppColor(
    0xFF10b981,
    <int, Color>{
      50: AppColors.emerald50,
      100: AppColors.emerald100,
      200: AppColors.emerald200,
      300: AppColors.emerald300,
      400: AppColors.emerald400,
      500: AppColors.emerald500,
      600: AppColors.emerald600,
      700: AppColors.emerald700,
      800: AppColors.emerald800,
      900: AppColors.emerald900,
    },
  );

  static const teal = AppColor(
    0xFF14b8a6,
    <int, Color>{
      50: AppColors.teal50,
      100: AppColors.teal100,
      200: AppColors.teal200,
      300: AppColors.teal300,
      400: AppColors.teal400,
      500: AppColors.teal500,
      600: AppColors.teal600,
      700: AppColors.teal700,
      800: AppColors.teal800,
      900: AppColors.teal900,
    },
  );

  static const cyan = AppColor(
    0xFF06b6d4,
    <int, Color>{
      50: AppColors.cyan50,
      100: AppColors.cyan100,
      200: AppColors.cyan200,
      300: AppColors.cyan300,
      400: AppColors.cyan400,
      500: AppColors.cyan500,
      600: AppColors.cyan600,
      700: AppColors.cyan700,
      800: AppColors.cyan800,
      900: AppColors.cyan900,
    },
  );

  static const sky = AppColor(
    0xFF0ea5e9,
    <int, Color>{
      50: AppColors.sky50,
      100: AppColors.sky100,
      200: AppColors.sky200,
      300: AppColors.sky300,
      400: AppColors.sky400,
      500: AppColors.sky500,
      600: AppColors.sky600,
      700: AppColors.sky700,
      800: AppColors.sky800,
      900: AppColors.sky900,
    },
  );

  // static const blue = AppColor(
  //   0xFF3b82f6,
  //   <int, Color>{
  //     50: AppColors.blue50,
  //     100: AppColors.blue100,
  //     200: AppColors.blue200,
  //     300: AppColors.blue300,
  //     400: AppColors.blue400,
  //     500: AppColors.blue500,
  //     600: AppColors.blue600,
  //     700: AppColors.blue700,
  //     800: AppColors.blue800,
  //     900: AppColors.blue900,
  //   },
  // );

  static const indigo = AppColor(
    0xFF6366f1,
    <int, Color>{
      50: AppColors.indigo50,
      100: AppColors.indigo100,
      200: AppColors.indigo200,
      300: AppColors.indigo300,
      400: AppColors.indigo400,
      500: AppColors.indigo500,
      600: AppColors.indigo600,
      700: AppColors.indigo700,
      800: AppColors.indigo800,
      900: AppColors.indigo900,
    },
  );

  static const violet = AppColor(
    0xFF8b5cf6,
    <int, Color>{
      50: AppColors.violet50,
      100: AppColors.violet100,
      200: AppColors.violet200,
      300: AppColors.violet300,
      400: AppColors.violet400,
      500: AppColors.violet500,
      600: AppColors.violet600,
      700: AppColors.violet700,
      800: AppColors.violet800,
      900: AppColors.violet900,
    },
  );

  static const purple = AppColor(
    0xFFa855f7,
    <int, Color>{
      50: AppColors.purple50,
      100: AppColors.purple100,
      200: AppColors.purple200,
      300: AppColors.purple300,
      400: AppColors.purple400,
      500: AppColors.purple500,
      600: AppColors.purple600,
      700: AppColors.purple700,
      800: AppColors.purple800,
      900: AppColors.purple900,
    },
  );

  static const fuchsia = AppColor(
    0xFFd946ef,
    <int, Color>{
      50: AppColors.fuchsia50,
      100: AppColors.fuchsia100,
      200: AppColors.fuchsia200,
      300: AppColors.fuchsia300,
      400: AppColors.fuchsia400,
      500: AppColors.fuchsia500,
      600: AppColors.fuchsia600,
      700: AppColors.fuchsia700,
      800: AppColors.fuchsia800,
      900: AppColors.fuchsia900,
    },
  );

  static const pink = AppColor(
    0xFFec4899,
    <int, Color>{
      50: AppColors.pink50,
      100: AppColors.pink100,
      200: AppColors.pink200,
      300: AppColors.pink300,
      400: AppColors.pink400,
      500: AppColors.pink500,
      600: AppColors.pink600,
      700: AppColors.pink700,
      800: AppColors.pink800,
      900: AppColors.pink900,
    },
  );

  static const rose = AppColor(
    0xFFf43f5e,
    <int, Color>{
      50: AppColors.rose50,
      100: AppColors.rose100,
      200: AppColors.rose200,
      300: AppColors.rose300,
      400: AppColors.rose400,
      500: AppColors.rose500,
      600: AppColors.rose600,
      700: AppColors.rose700,
      800: AppColors.rose800,
      900: AppColors.rose900,
    },
  );
}

class AppColors {
  static const Color black = Color.fromRGBO(12, 9, 42, 1);
  static const Color white = Color(0xFFFFFFFF);

  /// Slate
  static const Color slate50 = Color(0xFFf8fafc);
  static const Color slate100 = Color(0xFFf1f5f9);
  static const Color slate200 = Color(0xFFe2e8f0);
  static const Color slate300 = Color(0xFFcbd5e1);
  static const Color slate400 = Color(0xFF94a3b8);
  static const Color slate500 = Color(0xFF64748b);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1e293b);
  static const Color slate900 = Color(0xFF0f172a);

  /// Gray
  static const Color gray50 = Color(0xFFf9fafb);
  static const Color gray100 = Color(0xFFf3f4f6);
  static const Color gray200 = Color(0xFFe5e7eb);
  static const Color gray300 = Color(0xFFd1d5db);
  static const Color gray400 = Color(0xFF9ca3af);
  static const Color gray500 = Color(0xFF6b7280);
  static const Color gray600 = Color(0xFF4b5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1f2937);
  static const Color gray900 = Color(0xFF111827);

  /// Zinc
  static const Color zinc50 = Color(0xFFfafafa);
  static const Color zinc100 = Color(0xFFf4f4f5);
  static const Color zinc200 = Color(0xFFe4e4e7);
  static const Color zinc300 = Color(0xFFd4d4d8);
  static const Color zinc400 = Color(0xFFa1a1aa);
  static const Color zinc500 = Color(0xFF71717a);
  static const Color zinc600 = Color(0xFF52525b);
  static const Color zinc700 = Color(0xFF3f3f46);
  static const Color zinc800 = Color(0xFF27272a);
  static const Color zinc900 = Color(0xFF18181b);

  /// Neutral
  static const Color neutral50 = Color(0xFFfafafa);
  static const Color neutral100 = Color(0xFFf5f5f5);
  static const Color neutral200 = Color(0xFFe5e5e5);
  static const Color neutral300 = Color(0xFFd4d4d4);
  static const Color neutral400 = Color(0xFFa3a3a3);
  static const Color neutral500 = Color(0xFF737373);
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717);

  /// Stone
  static const Color stone50 = Color(0xFFfafaf9);
  static const Color stone100 = Color(0xFFf5f5f4);
  static const Color stone200 = Color(0xFFe7e5e4);
  static const Color stone300 = Color(0xFFd6d3d1);
  static const Color stone400 = Color(0xFFa8a29e);
  static const Color stone500 = Color(0xFF78716c);
  static const Color stone600 = Color(0xFF57534e);
  static const Color stone700 = Color(0xFF44403c);
  static const Color stone800 = Color(0xFF292524);
  static const Color stone900 = Color(0xFF1c1917);

  /// Red
  static const Color red50 = Color(0xFFfef2f2);
  static const Color red100 = Color(0xFFfee2e2);
  static const Color red200 = Color(0xFFfecaca);
  static const Color red300 = Color(0xFFfca5a5);
  static const Color red400 = Color(0xFFf87171);
  static const Color red500 = Color(0xFFef4444);
  static const Color red600 = Color(0xFFdc2626);
  static const Color red700 = Color(0xFFb91c1c);
  static const Color red800 = Color(0xFF991b1b);
  static const Color red900 = Color(0xFF7f1d1d);

  /// Orange
  static const Color orange50 = Color(0xFFfff7ed);
  static const Color orange100 = Color(0xFFffedd5);
  static const Color orange200 = Color(0xFFfed7aa);
  static const Color orange300 = Color(0xFFfdba74);
  static const Color orange400 = Color(0xFFfb923c);
  static const Color orange500 = Color(0xFFf97316);
  static const Color orange600 = Color(0xFFea580c);
  static const Color orange700 = Color(0xFFc2410c);
  static const Color orange800 = Color(0xFF9a3412);
  static const Color orange900 = Color(0xFF7c2d12);

  /// Amber
  static const Color amber50 = Color(0xFFfffbeb);
  static const Color amber100 = Color(0xFFfef3c7);
  static const Color amber200 = Color(0xFFfde68a);
  static const Color amber300 = Color(0xFFfcd34d);
  static const Color amber400 = Color(0xFFfbbf24);
  static const Color amber500 = Color(0xFFf59e0b);
  static const Color amber600 = Color(0xFFd97706);
  static const Color amber700 = Color(0xFFb45309);
  static const Color amber800 = Color(0xFF92400e);
  static const Color amber900 = Color(0xFF78350f);

  /// Yellow
  static const Color yellow50 = Color(0xFFfefce8);
  static const Color yellow100 = Color(0xFFfef9c3);
  static const Color yellow200 = Color(0xFFfef08a);
  static const Color yellow300 = Color(0xFFfde047);
  static const Color yellow400 = Color(0xFFfacc15);
  static const Color yellow500 = Color(0xFFeab308);
  static const Color yellow600 = Color(0xFFca8a04);
  static const Color yellow700 = Color(0xFFa16207);
  static const Color yellow800 = Color(0xFF854d0e);
  static const Color yellow900 = Color(0xFF713f12);

  /// Lime
  static const Color lime50 = Color(0xFFf7fee7);
  static const Color lime100 = Color(0xFFecfccb);
  static const Color lime200 = Color(0xFFd9f99d);
  static const Color lime300 = Color(0xFFbef264);
  static const Color lime400 = Color(0xFFa3e635);
  static const Color lime500 = Color(0xFF84cc16);
  static const Color lime600 = Color(0xFF65a30d);
  static const Color lime700 = Color(0xFF4d7c0f);
  static const Color lime800 = Color(0xFF3f6212);
  static const Color lime900 = Color(0xFF365314);

  /// Green
  static const Color green50 = Color(0xFFf0fdf4);
  static const Color green100 = Color(0xFFdcfce7);
  static const Color green200 = Color(0xFFbbf7d0);
  static const Color green300 = Color(0xFF86efac);
  static const Color green400 = Color(0xFF4ade80);
  static const Color green500 = Color(0xFF22c55e);
  static const Color green600 = Color(0xFF16a34a);
  static const Color green700 = Color(0xFF15803d);
  static const Color green800 = Color(0xFF166534);
  static const Color green900 = Color(0xFF14532d);

  /// Emerald
  static const Color emerald50 = Color(0xFFecfdf5);
  static const Color emerald100 = Color(0xFFd1fae5);
  static const Color emerald200 = Color(0xFFa7f3d0);
  static const Color emerald300 = Color(0xFF6ee7b7);
  static const Color emerald400 = Color(0xFF34d399);
  static const Color emerald500 = Color(0xFF10b981);
  static const Color emerald600 = Color(0xFF059669);
  static const Color emerald700 = Color(0xFF047857);
  static const Color emerald800 = Color(0xFF065f46);
  static const Color emerald900 = Color(0xFF064e3b);

  /// Teal
  static const Color teal50 = Color(0xFFf0fdfa);
  static const Color teal100 = Color(0xFFccfbf1);
  static const Color teal200 = Color(0xFF99f6e4);
  static const Color teal300 = Color(0xFF5eead4);
  static const Color teal400 = Color(0xFF2dd4bf);
  static const Color teal500 = Color(0xFF14b8a6);
  static const Color teal600 = Color(0xFF0d9488);
  static const Color teal700 = Color(0xFF0f766e);
  static const Color teal800 = Color(0xFF115e59);
  static const Color teal900 = Color(0xFF134e4a);

  /// Cyan
  static const Color cyan50 = Color(0xFFecfeff);
  static const Color cyan100 = Color(0xFFcffafe);
  static const Color cyan200 = Color(0xFFa5f3fc);
  static const Color cyan300 = Color(0xFF67e8f9);
  static const Color cyan400 = Color(0xFF22d3ee);
  static const Color cyan500 = Color(0xFF06b6d4);
  static const Color cyan600 = Color(0xFF0891b2);
  static const Color cyan700 = Color(0xFF0e7490);
  static const Color cyan800 = Color(0xFF155e75);
  static const Color cyan900 = Color(0xFF164e63);

  /// Sky
  static const Color sky50 = Color(0xFFf0f9ff);
  static const Color sky100 = Color(0xFFe0f2fe);
  static const Color sky200 = Color(0xFFbae6fd);
  static const Color sky300 = Color(0xFF7dd3fc);
  static const Color sky400 = Color(0xFF38bdf8);
  static const Color sky500 = Color(0xFF0ea5e9);
  static const Color sky600 = Color(0xFF0284c7);
  static const Color sky700 = Color(0xFF0369a1);
  static const Color sky800 = Color(0xFF075985);
  static const Color sky900 = Color(0xFF0c4a6e);

  /// Blue
  static const Color blue50 = Color(0xFFeff6ff);
  static const Color blue100 = Color(0xFFdbeafe);
  static const Color blue200 = Color(0xFFbfdbfe);
  static const Color blue300 = Color(0xFF93c5fd);
  static const Color blue400 = Color(0xFF60a5fa);
  static const Color blue500 = Color(0xFF3b82f6);
  static const Color blue600 = Color(0xFF2563eb);
  static const Color blue700 = Color(0xFF1d4ed8);
  static const Color blue800 = Color(0xFF1e40af);
  static const Color blue900 = Color(0xFF1e3a8a);

  /// Indigo
  static const Color indigo50 = Color(0xFFeef2ff);
  static const Color indigo100 = Color(0xFFe0e7ff);
  static const Color indigo200 = Color(0xFFc7d2fe);
  static const Color indigo300 = Color(0xFFa5b4fc);
  static const Color indigo400 = Color(0xFF818cf8);
  static const Color indigo500 = Color(0xFF6366f1);
  static const Color indigo600 = Color(0xFF4f46e5);
  static const Color indigo700 = Color(0xFF4338ca);
  static const Color indigo800 = Color(0xFF3730a3);
  static const Color indigo900 = Color(0xFF312e81);

  /// Violet
  static const Color violet50 = Color(0xFFf5f3ff);
  static const Color violet100 = Color(0xFFede9fe);
  static const Color violet200 = Color(0xFFddd6fe);
  static const Color violet300 = Color(0xFFc4b5fd);
  static const Color violet400 = Color(0xFFa78bfa);
  static const Color violet500 = Color(0xFF8b5cf6);
  static const Color violet600 = Color(0xFF7c3aed);
  static const Color violet700 = Color(0xFF6d28d9);
  static const Color violet800 = Color(0xFF5b21b6);
  static const Color violet900 = Color(0xFF4c1d95);

  /// Purple
  static const Color purple50 = Color(0xFFfaf5ff);
  static const Color purple100 = Color(0xFFf3e8ff);
  static const Color purple200 = Color(0xFFe9d5ff);
  static const Color purple300 = Color(0xFFd8b4fe);
  static const Color purple400 = Color(0xFFc084fc);
  static const Color purple500 = Color(0xFFa855f7);
  static const Color purple600 = Color(0xFF9333ea);
  static const Color purple700 = Color(0xFF7e22ce);
  static const Color purple800 = Color(0xFF6b21a8);
  static const Color purple900 = Color(0xFF581c87);

  /// Fuchsia
  static const Color fuchsia50 = Color(0xFFfdf4ff);
  static const Color fuchsia100 = Color(0xFFfae8ff);
  static const Color fuchsia200 = Color(0xFFf5d0fe);
  static const Color fuchsia300 = Color(0xFFf0abfc);
  static const Color fuchsia400 = Color(0xFFe879f9);
  static const Color fuchsia500 = Color(0xFFd946ef);
  static const Color fuchsia600 = Color(0xFFc026d3);
  static const Color fuchsia700 = Color(0xFFa21caf);
  static const Color fuchsia800 = Color(0xFF86198f);
  static const Color fuchsia900 = Color(0xFF701a75);

  /// Pink
  static const Color pink50 = Color(0xFFfdf2f8);
  static const Color pink100 = Color(0xFFfce7f3);
  static const Color pink200 = Color(0xFFfbcfe8);
  static const Color pink300 = Color(0xFFf9a8d4);
  static const Color pink400 = Color(0xFFf472b6);
  static const Color pink500 = Color(0xFFec4899);
  static const Color pink600 = Color(0xFFdb2777);
  static const Color pink700 = Color(0xFFbe185d);
  static const Color pink800 = Color(0xFF9d174d);
  static const Color pink900 = Color(0xFF831843);

  /// Rose
  static const Color rose50 = Color(0xFFfff1f2);
  static const Color rose100 = Color(0xFFffe4e6);
  static const Color rose200 = Color(0xFFfecdd3);
  static const Color rose300 = Color(0xFFfda4af);
  static const Color rose400 = Color(0xFFfb7185);
  static const Color rose500 = Color(0xFFf43f5e);
  static const Color rose600 = Color(0xFFe11d48);
  static const Color rose700 = Color(0xFFbe123c);
  static const Color rose800 = Color(0xFF9f1239);
  static const Color rose900 = Color(0xFF881337);
}
