import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/view/theme/app_colors.dart';
import 'package:weather_app/view/theme/app_text_theme.dart';

class AppTheme {
  factory AppTheme.light(ColorScheme? lightDynamic) {
    late final ColorScheme colorScheme;

    if (lightDynamic != null) {
      colorScheme = lightDynamic.harmonized();
    } else {
      colorScheme = ColorScheme.fromSeed(seedColor: AppColors.darkBlue);
    }
    final themeData = ThemeData.light(useMaterial3: true);
    return AppTheme._(
      themeData: themeData.copyWith(
        colorScheme: colorScheme,
        textTheme: AppTextTheme(Colors.black).textTheme,
      ),
    );
  }
  AppTheme._({required this.themeData});

  final ThemeData themeData;
}
