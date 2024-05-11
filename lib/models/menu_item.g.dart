// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      (json['price'] as num).toDouble(),
      json['image'] as String,
      (json['allowed_options'] as List<dynamic>)
          .map((e) => OptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['type'] as String?,
      json['ui_configuration'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.imageUrl,
      'allowed_options': instance.allowedOptions,
      'type': instance.type,
      'ui_configuration': instance.uiConfiguration,
    };
