import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:portfoliov3/core/extensions/context_extensions.dart';
import 'package:portfoliov3/features/widgets/screen_size.dart';
import 'package:portfoliov3/features/widgets/widget_skill_list.dart';

class DesktopSkills extends StatelessWidget {
  const DesktopSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSize(
      minimumSize: 500,
      child: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Center(
          child: [
            "My Skills".text(style: context.tt.displaySmall),

            16.gapHeight,

            "The stack behind my projects.".text().styled(color: context.cs.onSurfaceVariant),

            48.gapHeight,

            WidgetSkillList().center(),
          ].columnMainCenter(crossAxisAlignment: CrossAxisAlignment.start),
        ),
      ),
    );
  }
}