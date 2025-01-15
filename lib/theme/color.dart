import 'dart:ui';

import 'package:flutter/material.dart';

var colorScheme = const ColorScheme(
  primary: Color(0xFF3772FF), // Bright Blue
  onPrimary: Color(0xFFE6E8E6), // Light Gray for text/icons on primary
  secondary: Color(0xFFFDCA40), // Golden Yellow
  onSecondary: Color(0xFF080708), // Almost Black for text/icons on background
  surface: Color(0xFFE6E8E6), // Light Gray for elevated surfaces (same as background)
  onSurface: Color(0xFF080708), // Almost Black for text/icons on surface
  error: Color(0xFFDF2935), // Bright Red for errors
  onError: Color(0xFFE6E8E6), // Light Gray for text/icons on error background
  brightness: Brightness.light, // Adjust if you want a dark theme
);

const Color light = Color(0xFFF6F6F6);
const Color darkGrey = Color(0xFF939393);
const Color grey = Color(0xFFE0E0E0);