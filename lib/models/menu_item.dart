import 'package:graduate_work/models/abstract_classes.dart';
import 'package:graduate_work/models/option_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem implements PositionItem {
  @override
  final String id;
  @override
  final String name;

  final String description;
  @override
  final double price;
  @JsonKey(name: 'image')
  final String imageUrl;
  @JsonKey(name: 'allowed_options')
  final List<OptionItem> allowedOptions;
  final String? type;
  @JsonKey(name: 'ui_configuration')
  final Map<String, dynamic>? uiConfiguration;

  MenuItem(this.id, this.name, this.description, this.price, this.imageUrl,
      this.allowedOptions, this.type, this.uiConfiguration);

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
