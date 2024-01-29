import 'package:d_events/application/resource/theme_color.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlexTheme {
  static final theme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: ThemeColor.DarkPetrol,
      secondary: ThemeColor.Maize,
      tertiary: ThemeColor.Sienna,
      swapOnMaterial3: true,
    ),
    scheme: FlexScheme.custom,
    background: Colors.white,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 9,
    scaffoldBackground: Colors.white,
    subThemesData: const FlexSubThemesData(
      blendTextTheme: false,
      textButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      inputDecoratorRadius: 8.0,
      outlinedButtonBorderWidth: 0.5,
      outlinedButtonPressedBorderWidth: 0.5,
      toggleButtonsRadius: 4.0,
      toggleButtonsBorderWidth: 0.5,
      inputDecoratorUnfocusedBorderIsColored: false,
    ),

    keyColors: const FlexKeyColors(
      useSecondary: true,
      useTertiary: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );

  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.amber,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 15,
    subThemesData: const FlexSubThemesData(
      textButtonRadius: 12.0,
      elevatedButtonRadius: 12.0,
      outlinedButtonRadius: 12.0,
      outlinedButtonBorderWidth: 0.5,
      outlinedButtonPressedBorderWidth: 0.5,
      toggleButtonsRadius: 12.0,
      toggleButtonsBorderWidth: 0.5,
    ),
    keyColors: const FlexKeyColors(
      useSecondary: true,
      useTertiary: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  // themeMode: ThemeMode.system,
}

/*  FlexSchemeData(
      name: greenName,
      description: greenDescription,
      light: FlexSchemeColor(
        primary: greenLightPrimary,
        primaryContainer: greenLightPrimaryContainer,
        secondary: greenLightSecondary,
        secondaryContainer: greenLightSecondaryContainer,
        tertiary: greenLightTertiary,
        tertiaryContainer: greenLightTertiaryContainer,
        appBarColor: greenLightTertiary,
        error: materialLightErrorHc,
        swapOnMaterial3: true,
      ),
      dark: FlexSchemeColor(
        primary: greenDarkPrimary,
        primaryContainer: greenDarkPrimaryContainer,
        secondary: greenDarkSecondary,
        secondaryContainer: greenDarkSecondaryContainer,
        tertiary: greenDarkTertiary,
        tertiaryContainer: greenDarkTertiaryContainer,
        appBarColor: greenDarkTertiary,
        error: materialDarkError,
        swapOnMaterial3: true,
      ),
    ),*/