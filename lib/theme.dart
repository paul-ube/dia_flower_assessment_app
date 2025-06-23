import 'dart:io';

import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/app_constants.dart';

ThemeData getTheme(BuildContext context, Brightness brightness) {
  const TextTheme satoshiTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w700,
      fontSize: 57,
      letterSpacing: -0.25,
      // wordSpacing: 1.0,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w700,
      fontSize: 45,
      letterSpacing: -0.25,
      // wordSpacing: 1.0,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w700,
      fontSize: 36,
      letterSpacing: -0.15,
      // wordSpacing: 0.75,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 32,
      letterSpacing: -0.15,
      // wordSpacing: 0.75,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w600,
      fontSize: 36,
      letterSpacing: -0.15,
      // wordSpacing: 0.5,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 24,
      letterSpacing: -0.15,
      // wordSpacing: 0.5,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 22,
      letterSpacing: 0,
      // wordSpacing: 0.5,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.1,
      // wordSpacing: 0.25,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.0,
      // wordSpacing: 0.25,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.15,
      // wordSpacing: 0.25,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.1,
      // wordSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.25,
      // wordSpacing: 0.15,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 0.1,
      // wordSpacing: 0.2,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.1,
      // wordSpacing: 0.2,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Satoshi',
      fontFamilyFallback: ['sans-serif'],
      fontWeight: FontWeight.w500,
      fontSize: 11,
      letterSpacing: 0.1,
      // wordSpacing: 0.2,
    ),
  );

  final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFFCA9492),
    brightness: brightness,
  );

  final SearchBarThemeData cleanSearch = SearchBarThemeData(
    shadowColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
    elevation: WidgetStateProperty.all(3),
    backgroundColor: WidgetStatePropertyAll(colorScheme.surfaceContainerHigh),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  return ThemeData(
    useMaterial3: true,
    splashFactory: InkSparkle.splashFactory,
    scaffoldBackgroundColor: colorScheme.surface,
    colorScheme: colorScheme,
    // fontFamily: 'Satoshi',
    typography: Typography.material2021(
      platform:
          Platform.isIOS ? TargetPlatform.android : TargetPlatform.android,
    ),
    searchBarTheme: cleanSearch,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: systemUiOverlayStyle(brightness),
      centerTitle: false,
      toolbarHeight: m3ToolbarHeight,
    ),
    brightness: brightness,
    menuTheme: MenuThemeData(
      style: MenuStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(m3MediumShapeRadius),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(colorScheme.surfaceContainer),
        visualDensity: VisualDensity.comfortable,
      ),
    ),
  );
}

SystemUiOverlayStyle systemUiOverlayStyle(Brightness brightness) {
  var statusBarColor = Colors.transparent;
  var statusBarBrightness = Brightness.light;
  var statusBarIconBrightness = Brightness.dark;

  if (brightness == Brightness.dark) {
    statusBarColor = Colors.transparent;
    statusBarBrightness = Brightness.dark;
    statusBarIconBrightness = Brightness.light;
  }

  return SystemUiOverlayStyle(
    statusBarColor: statusBarColor,
    statusBarBrightness: statusBarBrightness,
    statusBarIconBrightness: statusBarIconBrightness,
  );
}
