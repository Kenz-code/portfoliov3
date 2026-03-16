import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:portfoliov3/features/desktop/desktop_about.dart';
import 'package:portfoliov3/features/mobile/mobile_about.dart';
import 'package:portfoliov3/features/mobile/mobile_projects.dart';
import 'package:portfoliov3/features/mobile/mobile_skills.dart';
import 'package:portfoliov3/features/widgets/smooth_scroll/smooth_scroll_gate.dart';

class MobileAll extends StatelessWidget {
  const MobileAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmoothScrollGate(
        child: [

          MobileAbout(),

          MobileSkills(),

          MobileProjects(),

        ].column(),
      ),
    );
  }
}
