// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardMenuItemModel _$CardMenuItemModelFromJson(Map<String, dynamic> json) =>
    CardMenuItemModel(
      MenuItem.fromJson(json['menu_item'] as Map<String, dynamic>),
      json['count'] as int,
    );

Map<String, dynamic> _$CardMenuItemModelToJson(CardMenuItemModel instance) =>
    <String, dynamic>{
      'menu_item': instance.model,
      'count': instance.count,
    };

CardPromotionModel _$CardPromotionModelFromJson(Map<String, dynamic> json) =>
    CardPromotionModel(
      PromotionItem.fromJson(json['promotion'] as Map<String, dynamic>),
      json['count'] as int,
    );

Map<String, dynamic> _$CardPromotionModelToJson(CardPromotionModel instance) =>
    <String, dynamic>{
      'promotion': instance.model,
      'count': instance.count,
    };

CardOrderModel _$CardOrderModelFromJson(Map<String, dynamic> json) =>
    CardOrderModel(
      json['preferred_delivery_time'] as String,
      json['customer_phone'] as String,
      (json['ordered_menu_items'] as List<dynamic>)
          .map((e) => CardMenuItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['ordered_promotions'] as List<dynamic>)
          .map((e) => CardPromotionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardOrderModelToJson(CardOrderModel instance) =>
    <String, dynamic>{
      'preferred_delivery_time': instance.preferredDeliveryTime,
      'customer_phone': instance.customerPhone,
      'ordered_menu_items': instance.orderedMenuItems,
      'ordered_promotions': instance.orderedPromotions,
    };
