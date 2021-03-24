import 'package:flutter/material.dart';

import 'app_colors.dart';

class ButtonThemes {
  ButtonThemes._();

  static ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: AppColors.buttonBgColor,
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 18
    ),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
    ),
  );
}