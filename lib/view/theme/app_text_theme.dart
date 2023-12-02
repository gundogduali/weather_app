import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/foundation/constants/size_constants.dart';

class AppTextTheme {
  factory AppTextTheme(Color color) {
    final urbanistTextTheme = GoogleFonts.urbanistTextTheme();
    return AppTextTheme._(
      textTheme: urbanistTextTheme.copyWith(
        displayLarge: urbanistTextTheme.displayLarge?.copyWith(
          fontSize: Sizes.k48,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        displayMedium: urbanistTextTheme.displayMedium?.copyWith(
          fontSize: Sizes.k40,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        displaySmall: urbanistTextTheme.displaySmall?.copyWith(
          fontSize: Sizes.k32,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        headlineLarge: urbanistTextTheme.headlineLarge?.copyWith(
          fontSize: Sizes.k24,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        headlineMedium: urbanistTextTheme.headlineMedium?.copyWith(
          fontSize: Sizes.k20,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        headlineSmall: urbanistTextTheme.headlineSmall?.copyWith(
          fontSize: Sizes.k18,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        bodyLarge: urbanistTextTheme.bodyLarge?.copyWith(
          fontSize: Sizes.k16,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        bodyMedium: urbanistTextTheme.bodyMedium?.copyWith(
          fontSize: Sizes.k14,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        bodySmall: urbanistTextTheme.bodySmall?.copyWith(
          fontSize: Sizes.k12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
  const AppTextTheme._({
    required this.textTheme,
  });
  final TextTheme textTheme;
}