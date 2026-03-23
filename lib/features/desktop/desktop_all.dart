import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:portfoliov3/features/desktop/desktop_about.dart';
import 'package:portfoliov3/features/desktop/desktop_projects.dart';
import 'package:portfoliov3/features/desktop/desktop_skills.dart';
import 'package:portfoliov3/features/widgets/footer.dart';
import 'package:portfoliov3/features/widgets/smooth_scroll/smooth_scroll_gate.dart';

class DesktopAll extends StatelessWidget {
  DesktopAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmoothScrollGate(
        child: [

          DesktopAbout(),

          DesktopSkills(),

          DesktopProjects(),

          Footer(),

        ].column(),
      ),
    );
  }
}
