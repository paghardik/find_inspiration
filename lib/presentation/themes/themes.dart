import 'package:flutter/material.dart';
import 'button_themes.dart';

import 'text_themes.dart';

class Themes {
  Themes._();

  static ThemeData get themeData =>  ThemeData.from(colorScheme: ColorScheme.light()).copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextThemes.textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonThemes.raisedButtonStyle),
  );


}