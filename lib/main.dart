import 'package:flutter/material.dart';
import 'package:portfoliov3/app/app.dart';
import 'package:portfoliov3/core/theme/colors.dart';
import 'package:portfoliov3/core/theme/theme.dart';
import 'package:portfoliov3/features/responsive_gate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: "KenboDev",
      theme: darkTheme,
      color: darkColorScheme.surface,
      home: AppLoader(
        child: ResponsiveGate()
      ),
    ),
  );
}