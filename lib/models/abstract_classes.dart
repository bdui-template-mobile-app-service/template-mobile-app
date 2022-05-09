import 'option_item.dart';

abstract class Identifiable {
  String get id;
}

abstract class Namable {
  String get name;
}

abstract class PositionItem implements Identifiable, Namable {}

abstract class CardPositionItem {
  PositionItem get model;
  Set<OptionItem> get selectedOptions;
  int get count;
}
