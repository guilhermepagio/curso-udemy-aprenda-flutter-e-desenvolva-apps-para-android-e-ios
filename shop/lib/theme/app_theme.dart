import 'package:flutter/material.dart';
import 'package:shop/utils/custom_route.dart';

class AppTheme {
  // Cores
  static const primaryColor = Colors.purple;
  static const accentColor = Colors.deepOrange;

  // Fonte Padrão
  static const defaultFontFamily = 'Lato';

  // Tema Claro
  static ThemeData lightTheme() {
    final lightThemeColorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      secondary: accentColor,
      brightness: Brightness.light,
    );

    final lightTextTheme = const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );

    final pageTransitionsTheme = PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      },
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: lightThemeColorScheme,
      fontFamily: defaultFontFamily,
      textTheme: lightTextTheme,
      pageTransitionsTheme: pageTransitionsTheme,
    );
  }
}
