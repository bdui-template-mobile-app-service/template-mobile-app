import 'option_item.dart';

abstract class PositionItem {
  String get id;
  String get name;
  double get price;
}

abstract class CardPositionItem {
  PositionItem get model;
  Set<OptionItem> get selectedOptions;
  int get count;
}
