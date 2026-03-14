import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:portfoliov3/features/widgets/screen_size.dart';

class DesktopSkills extends StatelessWidget {
  const DesktopSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSize(
      child: Center(
        child: "Skills".text()
      )
    );
  }
}
