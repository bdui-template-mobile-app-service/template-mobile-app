import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';

class StandardText extends StatelessWidget {
  static const defaultOverflow = TextOverflow.ellipsis;

  final String text;

  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  final TextStyle? style;

  /// Properties for replacing to standard (from context)
  final bool replaceTextColorToStandard;

  const StandardText(
      this.text, {
        Key? key,
        this.maxLines,
        this.overflow,
        this.style,
        this.textAlign,
        this.replaceTextColorToStandard = true,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    final finalStyle = (style ?? const TextStyle()).copyWith(
      color: replaceTextColorToStandard ? colorSet.primaryText : style?.color,
    );

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? defaultOverflow,
      maxLines: maxLines,
      style: finalStyle,
    );
  }
}
