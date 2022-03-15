import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem {
  final String id;
  final String name;
  final String description;
  final double price;
  @JsonKey(name: 'image')
  final String imageUrl;

  MenuItem(this.id, this.name, this.description, this.price, this.imageUrl);

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
