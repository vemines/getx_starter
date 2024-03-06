// Contain colors your want define or can't put in ColorScheme
import 'package:flutter/material.dart';

import '../constants/colors.dart';

abstract class ColorThemeExt {
  Color get warning;
  // don't use setter it looping
  setWarning(Color value) => warning == value;
  Color get success;
  setSuccess(Color value) => success == value;
  Color get info;
  setInfo(Color value) => info == value;
}

class LightColorThemeExt extends ColorThemeExt {
  @override
  Color get warning => lightWarning;
  @override
  Color get success => lightSuccess;
  @override
  Color get info => lightInfo;
}

class DarkColorThemeExt extends ColorThemeExt {
  @override
  Color get warning => darkWarning;
  @override
  Color get success => darkSuccess;
  @override
  Color get info => darkInfo;
}

class CustomColors extends ThemeExtension<CustomColors> {
  late ColorThemeExt colorTheme;
  CustomColors({required this.colorTheme});

  @override
  ThemeExtension<CustomColors> copyWith({ColorThemeExt? colorTheme}) {
    return CustomColors(colorTheme: colorTheme ?? this.colorTheme);
  }

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<CustomColors>? other,
    double t,
  ) {
    // check instance
    if (other is! CustomColors) return this;

    colorTheme.setWarning(lerpColor(colorTheme.warning, other.colorTheme.warning, t));
    colorTheme.setSuccess(lerpColor(colorTheme.success, other.colorTheme.success, t));
    colorTheme.setInfo(lerpColor(colorTheme.info, other.colorTheme.info, t));

    return this;
  }
}

CustomColors light = CustomColors(colorTheme: LightColorThemeExt());
CustomColors dark = CustomColors(colorTheme: DarkColorThemeExt());

Color lerpColor(Color a, Color b, double t) => Color.lerp(a, b, t) ?? a;
