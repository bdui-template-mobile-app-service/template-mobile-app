// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionItem _$PromotionItemFromJson(Map<String, dynamic> json) =>
    PromotionItem(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      (json['price'] as num).toDouble(),
      json['image'] as String,
      json['over_image_text_color'] as String,
      (json['menu_items'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PromotionItemToJson(PromotionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.imageUrl,
      'over_image_text_color': instance.stringTextColor,
      'menu_items': instance.menuItems,
    };
