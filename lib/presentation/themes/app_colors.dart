import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static final Color dodger_blue = Color(0xff5663FF);
  static final Color supernovaapprox = Color(0xffFFCC00);
  static final Color appBarColor = Color(0xffb7db6d);


  static Color selectedColor(@required bool isSelected){
    return isSelected ? Colors.red : Colors.black87;
  }

}



