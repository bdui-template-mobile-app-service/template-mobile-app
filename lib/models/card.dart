import 'package:json_annotation/json_annotation.dart';

import 'menu_item.dart';
import 'promotion_item.dart';

part 'card.g.dart';

@JsonSerializable()
class CardMenuItemModel {
  @JsonKey(name: 'menu_item')
  final MenuItem model;
  int count;

  CardMenuItemModel(this.model, this.count);

  factory CardMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$CardMenuItemModelFromJson(json);
  Map<String, dynamic> toJson() => {
        'menu_item': model.id,
        'count': count,
      };
}

@JsonSerializable()
class CardPromotionModel {
  @JsonKey(name: 'promotion')
  final PromotionItem model;
  int count;

  CardPromotionModel(this.model, this.count);

  factory CardPromotionModel.fromJson(Map<String, dynamic> json) =>
      _$CardPromotionModelFromJson(json);
  Map<String, dynamic> toJson() => {
        'promotion': model.id,
        'count': count,
      };
}

@JsonSerializable()
class CardOrderModel {
  @JsonKey(name: 'preferred_delivery_time')
  final String preferredDeliveryTime;

  @JsonKey(name: 'customer_phone')
  final String customerPhone;

  @JsonKey(name: 'ordered_menu_items')
  final List<CardMenuItemModel> orderedMenuItems;

  @JsonKey(name: 'ordered_promotions')
  final List<CardPromotionModel> orderedPromotions;

  CardOrderModel(
    this.preferredDeliveryTime,
    this.customerPhone,
    this.orderedMenuItems,
    this.orderedPromotions,
  );

  factory CardOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CardOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardOrderModelToJson(this);
}
