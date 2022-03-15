import 'package:flutter/material.dart';

extension MinusedBorderRadius on BorderRadius {
  BorderRadius minusedByBorderRadius(BorderRadius other) => BorderRadius.only(
    topLeft: (topLeft != Radius.zero) ? topLeft - other.topLeft : topLeft,
    topRight:
    (topRight != Radius.zero) ? topRight - other.topRight : topRight,
    bottomLeft: (bottomLeft != Radius.zero)
        ? bottomLeft - other.bottomLeft
        : bottomLeft,
    bottomRight: (bottomRight != Radius.zero)
        ? bottomRight - other.bottomRight
        : bottomRight,
  );
  BorderRadius minusedByRadius(Radius all) =>
      minusedByBorderRadius(BorderRadius.all(all));
  BorderRadius minusedByConst(double all) =>
      minusedByRadius(Radius.circular(all));
}
