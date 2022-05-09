import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option_item.g.dart';

@JsonSerializable()
class OptionItem extends Equatable {
  final String id;
  final String name;
  final double price;

  const OptionItem(this.id, this.name, this.price);

  factory OptionItem.fromJson(Map<String, dynamic> json) =>
      _$OptionItemFromJson(json);
  Map<String, dynamic> toJson() => _$OptionItemToJson(this);

  @override
  List<Object?> get props => [id];
}
