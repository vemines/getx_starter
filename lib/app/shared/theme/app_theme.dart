// App theme light/dark mode use in app

import 'package:flutter/material.dart';

import 'theme_extension.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    extensions: <ThemeExtension>[light],
  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    extensions: <ThemeExtension>[dark],
  );
}
