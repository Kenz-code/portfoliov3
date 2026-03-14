import 'package:exui/exui.dart';
import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  final Widget child;

  const ScreenSize({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return child.sizedHeight(screenHeight);
  }
}
