import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:portfoliov3/core/extensions/context_extensions.dart';
import 'package:portfoliov3/features/desktop/desktop_about.dart';
import 'package:portfoliov3/features/desktop/desktop_skills.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class DesktopAll extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  DesktopAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebSmoothScroll(
        controller: _scrollController,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          controller: _scrollController,
          child: [

            DesktopAbout(),

            DesktopSkills(),

          ].column(),
        ),
      ),
    );
  }
}
