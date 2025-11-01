

  import 'package:flutter/material.dart';
import 'package:week6_task/config/theme/app_colors.dart';

ThemeData lightTheme ()
  {
    return ThemeData(
      brightness: Brightness.light,
      
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        tertiary: AppColors.tertiaryColor,
        surface: AppColors.backgroundColor,
        onSurface:  AppColors.onSurface,
      ),
 

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
      cardColor: AppColors.cardColor,
      
    );

    
  }