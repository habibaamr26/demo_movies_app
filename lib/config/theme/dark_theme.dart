import 'package:flutter/material.dart';
import 'package:week6_task/config/theme/app_colors.dart';



ThemeData darkTheme ()
  {
    return ThemeData(
      brightness: Brightness.dark,
      
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryColorK,
        secondary: AppColors.secondaryColorK,
        tertiary: AppColors.tertiaryColorK,
        surface: AppColors.backgroundColorK,
        onSurface:  AppColors.onSurfaceK,
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
      cardColor: AppColors.cardColorK,
      
    );

    
  }