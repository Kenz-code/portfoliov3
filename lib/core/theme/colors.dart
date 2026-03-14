import 'package:flutter/material.dart';

final ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,

  // Primary
  primary: Color(0xFF7950F2), // green-6
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFF3F0FF), // green-1
  onPrimaryContainer: Color(0xFF5F3DC4), // green-8

  // Secondary
  secondary: Color(0xFF1098AD), // cyan-7
  onSecondary: Colors.white,
  secondaryContainer: Color(0xFFE3FAFC), // cyan-1
  onSecondaryContainer: Color(0xFF0C8599), // cyan-8

  // Tertiary
  tertiary: Color(0xFF7950F2), // violet-6
  onTertiary: Colors.white,
  tertiaryContainer: Color(0xFFF3F0FF), // violet-1
  onTertiaryContainer: Color(0xFF5F3DC4), // violet-8

  // Error
  error: Color(0xFFFA5252), // red-6
  onError: Colors.white,
  errorContainer: Color(0xFFFFE3E3), // red-1
  onErrorContainer: Color(0xFFC92A2A), // red-8

  // Surface
  surface: Colors.white,
  onSurface: Color(0xFF343A40), // grey-8
  onSurfaceVariant: Color(0xFF868E96), // grey-6

  // Surface Containers
  surfaceContainerHighest: Color(0xFFE9ECEF), // gray-2
  surfaceContainerHigh: Color(0xFFF1F3F5), // gray-1
  surfaceContainer: Color(0xFFF8F9FA), // gray-0
  surfaceContainerLow: Color(0xFFFDFEFF), // very light, near-white
  surfaceContainerLowest: Colors.white,

  // Outline & Shadow
  outline: Color(0xFFADB5BD), // gray-5
  shadow: Colors.black,
);

final ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  // Primary
  primary: "#ff8787".toColor(), // green-4
  onPrimary: Color(0xFF1B1C1E), // near-black
  primaryContainer: "#e03131".toColor(), // green-8
  onPrimaryContainer: "#ffc9c9".toColor(), // violet-2

  // Secondary
  secondary: Color(0xFF22B8CF), // cyan-5
  onSecondary: Color(0xFF1B1C1E),
  secondaryContainer: Color(0xFF0B7285), // cyan-9
  onSecondaryContainer: Color(0xFFC5F6FA), // cyan-2

  // Tertiary
  tertiary: Color(0xFF9775FA), // violet-5
  onTertiary: Color(0xFF1B1C1E),
  tertiaryContainer: Color(0xFF5F3DC4), // violet-8
  onTertiaryContainer: Color(0xFFD0BFFF), // violet-2

  // Error
  error: Color(0xFFFF6B6B), // red-5
  onError: Color(0xFF1B1C1E),
  errorContainer: Color(0xFFC92A2A), // red-8
  onErrorContainer: Color(0xFFFFC9C9), // red-2

  // Surface
  surface: Color(0xFF212529), // grey-9
  onSurface: Color(0xFFF8F9FA), // gray-0
  onSurfaceVariant: Color(0xFFADB5BD), // gray-5

  // Surface Containers
  surfaceContainerHighest: Color(0xFF495057), // gray-7
  surfaceContainerHigh: Color(0xFF3F454B), // between gray-7 and gray-8
  surfaceContainer: Color(0xFF343A40), // gray-8
  surfaceContainerLow: Color(0xFF2B2F33), // darker gray
  surfaceContainerLowest: Color(0xFF212529), // grey-9

  // Outline & Shadow
  outline: Color(0xFF868E96), // gray-6
  shadow: Colors.black,
);

extension HexColor on String {
  Color toColor() {
    final hex = replaceAll('#', '').trim();

    final fullHex = switch (hex.length) {
      6 => 'FF$hex',
      8 => hex,
      3 => 'FF${hex.split('').map((c) => '$c$c').join()}',
      _ => throw FormatException('Invalid hex color: $hex'),
    };

    return Color(int.parse(fullHex, radix: 16));
  }
}