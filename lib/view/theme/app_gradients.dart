import 'package:flutter/material.dart';
import 'package:weather_app/view/theme/app_colors.dart';

class AppGradients {
  const AppGradients._();

  static LinearGradient get blueGradient => const LinearGradient(
        colors: [
          AppColors.darkBlue,
          AppColors.lightBlue,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
}
