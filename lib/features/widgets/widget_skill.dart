import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfoliov3/core/extensions/context_extensions.dart';
import 'package:portfoliov3/features/widgets/hover_card.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetSkill extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetName;
  final String website;
  final Color? iconColor;

  const WidgetSkill({
    super.key,
    required this.title,
    required this.subtitle,
    required this.assetName,
    required this.website,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final Uri url = Uri.parse(website);
        launchUrl(url);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HoverCard(
            child: Container(
              width: 260,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    assetName,
                    width: 48,
                    height: 48,
                    color: iconColor,
                  ),

                  SizedBox(width: 16,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: context.tt.titleLarge!.copyWith(
                          color: context.cs.onSurface
                      ),),
                      SizedBox(height: 8),
                      Text(subtitle),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
