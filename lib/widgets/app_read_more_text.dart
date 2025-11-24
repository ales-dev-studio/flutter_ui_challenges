import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AppReadMoreText extends StatelessWidget {
  const AppReadMoreText(
      this.text, {
        super.key,
        this.textAlign,
        this.style,
        this.trimLines,
        this.color,
      });

  final String? text;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? trimLines;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    return ReadMoreText(
      text ?? '',
      textAlign: textAlign ?? TextAlign.justify,
      trimLines: trimLines ?? 5,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' Read more',
      trimExpandedText: ' Read less',
      moreStyle: TextStyle(color: color),
      lessStyle: TextStyle(color: color),
    );
  }
}
