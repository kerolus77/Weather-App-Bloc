import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTheme {
  static ThemeData data(BuildContext context) => ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
            primary: AppColors.primary, seedColor: AppColors.background),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'MARAI'),
        primaryColor: AppColors.primary,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
      );
}
