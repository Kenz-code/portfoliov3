import 'package:flutter/material.dart';

extension ContextTheme on BuildContext {
  ColorScheme get cs => Theme.of(this).colorScheme;
  TextTheme get tt => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}