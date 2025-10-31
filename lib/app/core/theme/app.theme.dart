import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Epilogue',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, color: Color(0xFF611E27), letterSpacing: -0.25, height: 1.1),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, color: Color(0xFF611E27), height: 1.15),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: Color(0xFF611E27), height: 1.22),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Color(0xFF611E27), height: 1.25),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Color(0xFF611E27), height: 1.28),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Color(0xFF611E27), height: 1.33),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFF611E27), height: 1.27),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF611E27), height: 1.4, letterSpacing: 0.15),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF611E27), height: 1.4, letterSpacing: 0.1),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87, height: 1.4, letterSpacing: 0.5),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87, height: 1.4, letterSpacing: 0.25),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54, height: 1.3, letterSpacing: 0.4),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF611E27), height: 1.4, letterSpacing: 0.1),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF611E27), height: 1.3, letterSpacing: 0.5),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF611E27), height: 1.4, letterSpacing: 0.5),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF611E27), // marrom avermelhado principal
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF8B2F3C), // tom intermediário do logo
      onPrimaryContainer: Color(0xFFFFFFFF),
      secondary: Color(0xFF8B2F3C),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFB54B5D),
      onSecondaryContainer: Color(0xFFFFFFFF),
      tertiary: Color(0xFF9E9E9E),
      onTertiary: Color(0xFFFFFFFF),
      surface: Color(0xFFF8F4F2), // bege de fundo
      onSurface: Color(0xFF2E3238),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: const Color(0xFFF8F4F2),
      surfaceTintColor: const Color(0xFFF8F4F2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      titleTextStyle: const TextStyle(
        color: Color(0xFF611E27),
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Epilogue',
      ),
    ),
    tooltipTheme: TooltipThemeData(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Epilogue',
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF611E27),
        borderRadius: BorderRadius.circular(7),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF611E27),
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F4F2),
  );
}
