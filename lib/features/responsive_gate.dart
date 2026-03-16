import 'package:flutter/material.dart';
import 'package:portfoliov3/features/desktop/desktop_all.dart';
import 'package:portfoliov3/features/mobile/mobile_all.dart';

class ResponsiveGate extends StatelessWidget {
  const ResponsiveGate({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return screenWidth > 760 ? DesktopAll() : MobileAll();
  }
}
