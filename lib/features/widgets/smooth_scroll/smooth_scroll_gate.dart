import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'smooth_scroll_gate_stub.dart'
    if (dart.library.js_interop) 'smooth_scroll_gate_web.dart';

class SmoothScrollGate extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const SmoothScrollGate({super.key, required this.child, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return buildWebScroll(child, padding);
    }
    return SingleChildScrollView(padding: padding, child: child);
  }
}