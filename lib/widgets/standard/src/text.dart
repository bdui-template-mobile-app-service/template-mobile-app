import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';

class StandardText extends StatelessWidget {
  final String text;

  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;

  final TextStyle? style;

  const StandardText(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.style,
    this.textAlign,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    final finalStyle = (style ?? const TextStyle()).copyWith(
      color: style?.color ?? colorSet.primaryText,
    );

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: finalStyle,
    );
  }
}
