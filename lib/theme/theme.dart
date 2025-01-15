import 'package:flutter/material.dart';
import 'package:link_you_task/theme/typography.dart';

import 'color.dart';


var theme = ThemeData(
  colorScheme: colorScheme,
  useMaterial3: true,
  textTheme: textTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: colorScheme.primary,
    foregroundColor: Colors.white,
  ),
);