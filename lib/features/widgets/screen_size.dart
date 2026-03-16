import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  final Widget child;
  final double minimumSize;

  const ScreenSize({
    super.key,
    required this.child,
    required this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double resolvedMinHeight = screenHeight < minimumSize
        ? minimumSize
        : screenHeight;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: resolvedMinHeight,
      ),
      child: IntrinsicHeight(
        child: child,
      ),
    );
  }
}