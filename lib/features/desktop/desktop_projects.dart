import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:portfoliov3/core/extensions/context_extensions.dart';
import 'package:portfoliov3/core/utils/project_utils.dart';
import 'package:portfoliov3/features/widgets/screen_size.dart';
import 'package:portfoliov3/features/widgets/widget_project_card.dart';

class DesktopProjects extends StatelessWidget {
  const DesktopProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      Row(
        children: [
          "My Projects".text(style: context.tt.displaySmall),
        ],
      ),

      24.gapHeight,

      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 32,
        children: [
          WidgetProjectCard(projectUtils: projectUtilsItems[3]),

          WidgetProjectCard(projectUtils: projectUtilsItems[2]),

          WidgetProjectCard(projectUtils: projectUtilsItems[0]),
        ],
      ).maxWidth(750)

    ].columnMainCenter().paddingAll(64.0);
  }
}
