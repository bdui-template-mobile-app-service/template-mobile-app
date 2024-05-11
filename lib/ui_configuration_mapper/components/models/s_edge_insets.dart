import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

@JsonSerializable()
class SEdgeInsets extends EdgeInsets {
  const SEdgeInsets.only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) : super.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );
  const SEdgeInsets.all(double value) : super.all(value);
  const SEdgeInsets() : super.all(0);

  factory SEdgeInsets.fromJson(String value) {
    final doubles = value
        .replaceAll(" ", "")
        .split(",")
        .map((e) => double.tryParse(e))
        .whereNotNull()
        .toList();
    if (doubles.length != 4) {
      return const SEdgeInsets.only();
    }
    return SEdgeInsets.only(
      left: doubles[0],
      top: doubles[1],
      right: doubles[2],
      bottom: doubles[3],
    );
  }

  String toJson() {
    return "$left,$top,$right,$bottom";
  }
}
