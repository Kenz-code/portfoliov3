import 'package:flutter/material.dart';
import 'package:portfoliov3/core/theme/theme.dart';
import 'package:portfoliov3/features/desktop/desktop_all.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KenboDev',
      theme: darkTheme,
      home: DesktopAll(),
    );
  }
}