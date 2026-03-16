import 'package:flutter/material.dart';

/// A text widget that automatically scales down its font size to fit within
/// the available space, down to [minFontSize].
class FittingText extends StatelessWidget {
  const FittingText(
      this.text, {
        super.key,
        this.style,
        this.minFontSize = 12.0,
        this.maxLines,
        this.textAlign,
        this.overflow = TextOverflow.ellipsis,
      });

  final String text;
  final TextStyle? style;
  final double minFontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final baseStyle = (style ?? DefaultTextStyle.of(context).style);
        final maxFontSize = baseStyle.fontSize ?? 14.0;

        final fittedSize = _binarySearch(
          text: text,
          style: baseStyle,
          constraints: constraints,
          maxLines: maxLines,
          min: minFontSize,
          max: maxFontSize,
        );

        return Text(
          text,
          style: baseStyle.copyWith(fontSize: fittedSize),
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow,
        );
      },
    );
  }

  double _binarySearch({
    required String text,
    required TextStyle style,
    required BoxConstraints constraints,
    required int? maxLines,
    required double min,
    required double max,
  }) {
    if (min >= max) return min;

    // Check if max already fits — skip the search entirely
    if (_fits(text, style.copyWith(fontSize: max), constraints, maxLines)) {
      return max;
    }

    double lo = min;
    double hi = max;
    double best = min;

    // Binary search with 0.5sp precision
    while (hi - lo > 0.5) {
      final mid = (lo + hi) / 2;
      if (_fits(text, style.copyWith(fontSize: mid), constraints, maxLines)) {
        best = mid;
        lo = mid;
      } else {
        hi = mid;
      }
    }

    return best;
  }

  bool _fits(
      String text,
      TextStyle style,
      BoxConstraints constraints,
      int? maxLines,
      ) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: constraints.maxWidth);

    return !painter.didExceedMaxLines &&
        painter.height <= constraints.maxHeight;
  }
}