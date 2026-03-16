import 'package:flutter/material.dart';
import 'package:portfoliov3/core/extensions/context_extensions.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final double customScaleDouble;
  final bool disableEnlightening;

  const HoverCard({super.key, required this.child, this.customScaleDouble=1.05, this.disableEnlightening=false});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _isHovered ? widget.customScaleDouble : 1,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOutCirc,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutCirc,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: _isHovered ? widget.disableEnlightening ? context.cs.surfaceContainer : context.cs.surfaceContainerHigh : context.cs.surfaceContainer
            ),
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
