import 'package:flutter/material.dart';

import 'text_themes.dart';

class Themes {
  Themes._();

  static ThemeData get themeData => ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextThemes.textTheme);
}
