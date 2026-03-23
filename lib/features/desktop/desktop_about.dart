import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfoliov3/core/extensions/context_extensions.dart';
import 'package:portfoliov3/features/widgets/screen_size.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopAbout extends StatelessWidget {
  const DesktopAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth = (screenWidth / 1920) * 900;

    return ScreenSize(
      minimumSize: 500,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 64),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    "16y/o - Based in Alberta, Canada".text(style: context.tt.titleMedium!.copyWith(color: context.cs.onSurfaceVariant)),

                    16.gapHeight,

                    "Hey, I'm Kenzie Paul. I'm a".text(style: context.tt.displaySmall!.copyWith(color: context.cs.onSurfaceVariant)),

                    8.gapHeight,

                    "Flutter Developer".text(style: context.tt.displayLarge),

                    16.gapHeight,

                    [
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/github.svg",
                          width: 24,
                          height: 24,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          final Uri url = Uri.parse("https://github.com/Kenz-code");
                          launchUrl(url);
                        },
                      )
                    ].row(),

                    16.gapHeight,

                    "I've been writing code since I was 10. Started with games,\nnow I build Flutter apps.".text().styled(color: context.cs.onSurfaceVariant)
                  ],
                ).center(),
              ],
            ),
          ),

          Row(
            children: [
              Image.asset(
                "assets/kenbodev.png",
                width: 48,
                height: 48,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),

              16.gapRow,

              "KenboDev".text(style: context.tt.labelLarge!.copyWith(color: context.cs.onSurfaceVariant)),
            ],
          ).paddingAll(64.0).alignTopLeft(),
      
          Positioned(
            right: -120,
            top: 0,
            bottom: 0,
            child: Image.asset("assets/landing_screenshots.png", width: imageWidth),
          ),
        ],
      ),
    );
  }
}
