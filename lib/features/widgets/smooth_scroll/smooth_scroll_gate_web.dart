import 'package:flutter/material.dart';
import 'dart:js_interop';
import 'package:web/web.dart' as web;
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

@JS('navigator.maxTouchPoints')
external int get maxTouchPoints;

Widget buildWebScroll(Widget child, EdgeInsets padding) {
  final scrollController = ScrollController();

  final userAgent = web.window.navigator.userAgent.toLowerCase();
  final isMobileUA = userAgent.contains('mobile') ||
      userAgent.contains('android') ||
      userAgent.contains('iphone');
  final hasTouchScreen = maxTouchPoints > 0;

  if (isMobileUA || hasTouchScreen) {
    return SingleChildScrollView(padding: padding, child: child);
  }

  return WebSmoothScroll(
    controller: scrollController,
    child: SingleChildScrollView(
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      child: child,
    ),
  );
}