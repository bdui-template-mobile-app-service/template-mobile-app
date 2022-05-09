import 'package:flutter/material.dart';
import 'package:graduate_work/arch/utils.dart';
import 'package:graduate_work/models/abstract_classes.dart';
import 'package:graduate_work/models/menu_item.dart';
import 'package:graduate_work/models/promotion_item.dart';

import '../models/card.dart';
import '../models/option_item.dart';

class CardProvider extends ChangeNotifier {
  List<CardMenuItemModel> _menuItems = [];
  List<CardPromotionModel> _promotions = [];

  List<CardMenuItemModel> get menuItems => _menuItems;
  List<CardPromotionModel> get promotions => _promotions;

  void addMenuItem(MenuItem model, Set<OptionItem> selectedOptions) {
    final index =
        _indexExistingPositionItem(model, selectedOptions, _menuItems);

    if (index == null) {
      _menuItems.add(CardMenuItemModel(model, selectedOptions, 1));
    } else {
      _menuItems[index].count += 1;
    }

    notifyListeners();
  }

  void addPromotion(PromotionItem model, Set<OptionItem> selectedOptions) {
    final index =
        _indexExistingPositionItem(model, selectedOptions, _promotions);

    if (index == null) {
      _promotions.add(CardPromotionModel(model, selectedOptions, 1));
    } else {
      _promotions[index].count += 1;
    }

    notifyListeners();
  }

  void deleteOneMenuItem(MenuItem model, Set<OptionItem> selectedOptions) {
    final index =
        _indexExistingPositionItem(model, selectedOptions, _menuItems);

    if (index == null) return;
    _menuItems[index].count -= 1;
    if (_menuItems[index].count <= 0) _menuItems.removeAt(index);

    notifyListeners();
  }

  void deleteOnePromotion(
      PromotionItem model, Set<OptionItem> selectedOptions) {
    final index =
        _indexExistingPositionItem(model, selectedOptions, _promotions);

    if (index == null) return;

    _promotions[index].count -= 1;
    if (_promotions[index].count <= 0) _promotions.removeAt(index);

    notifyListeners();
  }

  CardMenuItemModel? cardMenuItemModelBy(
    MenuItem model,
    Set<OptionItem> selectedOptions,
  ) {
    final index = _indexExistingPositionItem(
      model,
      selectedOptions,
      _menuItems,
    );

    if (index == null) return null;
    return _menuItems[index];
  }

  CardPromotionModel? cardPromotionModelBy(
    PromotionItem model,
    Set<OptionItem> selectedOptions,
  ) {
    final index = _indexExistingPositionItem(
      model,
      selectedOptions,
      _promotions,
    );

    if (index == null) return null;
    return _promotions[index];
  }

  int? _indexExistingPositionItem(
    PositionItem model,
    Set<OptionItem> selectedOptions,
    List<CardPositionItem> store,
  ) {
    final index = store.indexWhere(
      (e) =>
          e.model.id == model.id &&
          e.selectedOptions.isEqualToOther(selectedOptions),
    );

    if (index == -1) return null;
    return index;
  }

  void removeAll() {
    _promotions = [];
    _menuItems = [];
    notifyListeners();
  }
}
