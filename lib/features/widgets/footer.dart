import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:flutter/material.dart';
import 'package:portfoliov3/core/extensions/context_extensions.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        children: <Widget>[
          AutoSizeText("Made with Flutter by KenboDev", style: context.tt.bodyMedium!.copyWith(color: context.cs.onSurfaceVariant),)
        ],
      ),
    );
  }
}
