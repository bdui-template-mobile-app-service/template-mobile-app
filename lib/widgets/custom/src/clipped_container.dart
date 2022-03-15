import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';
import '../../../styles/src/color_set.dart';
import '../../../styles/src/styles_constants.dart';
import '../../extensions/extensions.dart';

class ClipperContainer extends StatelessWidget {
  /// Container properties
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  /// Decoration properties
  final Color? color;
  final BoxBorder? border;
  final BorderRadius? borderRadius;

  const ClipperContainer({
    Key? key,
    this.child,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.color,
    this.border,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;
    // Remove if color is clear
    // TODO make for all sides
    var finalBorder = border?.top.color == ColorSet.staticClear ? null : border;

    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: finalBorder,
        borderRadius: borderRadius,
        color: color,
        boxShadow: StylesConstants.cardShadow(colorSet.shadow),
      ),
      child: ClipRRect(
        // TODO make for all sides
        borderRadius:
        borderRadius?.minusedByConst(finalBorder?.top.width ?? 0) ??
            BorderRadius.zero,
        child: child,
      ),
    );
  }
}
