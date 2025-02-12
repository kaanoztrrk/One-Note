import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //* App Basic Colors

  static const Color primary = Color(0xffF26E56);
  static const Color accent = Color(0xffb0c7ff);

  static const Color completed = Color(0xFF53C2C5);
  static const Color inProgress = Color(0xFFFEC347);
  static const Color ongoing = Color(0xFF5694F2);
  static const Color canceled = Color(0xFFF26E56);

  static const Color turquoise = Color(0xFF53C2C5);
  static const Color lemon = Color(0xFFFEC347);
  static const Color blue = Color(0xFF5694F2);
  static const Color coral = Color(0xFFF26E56);
  static const Color purple = Color(0xFF7E57C2);
  static const Color orange = Color(0xFFFF9800);
  static const Color green = Color(0xFF4CAF50);
  static const Color indigo = Color(0xFF2196F3);
  static const Color deepOrange = Color(0xFFFF5722);
  static const Color brown = Color(0xFF795548);

/*
  / Graident Colors
  static const Gradient linergradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);
 */

  //* Text Colors

  static const Color textPrimary = Color(0xff130807);
  static const Color textSecondary = Color(0xff495057);
  static const Color textWhite = Color.fromARGB(255, 255, 255, 255);

  //* Background Colors

  static const Color ligth = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  //* Background Cotainer Colors

  static const Color ligthContainer = Color(0xffffffff);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  //* Button Colors

  static const Color buttonPrimary = Color(0xffF26E56);
  static const Color buttonSecondary = Color(0xff6c757d);
  static const Color buttonDisabled = Color(0xffc4c4c4);

  //* Border Colors

  static const Color borderPrimary = Color(0xff444444);
  static const Color borderSecondary = Color(0xffe6e6e6);

  //* Error and Validation Colors

  static const Color error = Color(0xffd43f2f);
  static const Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976d2);

  //* Neutral Shades
  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkgrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color ligthGrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
}
