import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promotion_item.g.dart';

@JsonSerializable()
class PromotionItem {
  final String name;
  final String description;
  final double price;
  @JsonKey(name: 'image')
  final String imageUrl;
  @JsonKey(name: 'over_image_text_color')
  final String stringTextColor;

  Color get textColor {
    final stringToColor = {
      'WHITE': Colors.white,
      'BLACK': Colors.black,
    };
    return stringToColor[stringTextColor] ?? Colors.white;
  }

  PromotionItem(
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.stringTextColor,
  );

  factory PromotionItem.fromJson(Map<String, dynamic> json) =>
      _$PromotionItemFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionItemToJson(this);
}
