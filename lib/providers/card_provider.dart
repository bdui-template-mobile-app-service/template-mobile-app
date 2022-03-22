import 'package:flutter/material.dart';
import 'package:graduate_work/models/menu_item.dart';
import 'package:graduate_work/models/promotion_item.dart';

class CountedModel<T> {
  final T model;
  int count;

  CountedModel(this.model, this.count);
}

typedef CardMenuItemsCountedModel = CountedModel<MenuItem>;
typedef CardPromotionsCountedModel = CountedModel<PromotionItem>;

class CardProvider extends ChangeNotifier {
  List<CardMenuItemsCountedModel> _menuItems = [];
  List<CardPromotionsCountedModel> _promotions = [];

  List<CardMenuItemsCountedModel> get menuItems => _menuItems;
  List<CardPromotionsCountedModel> get promotions => _promotions;

  void updateMenuItem(CardMenuItemsCountedModel countedMenuItem) {
    final index =
        _menuItems.indexWhere((e) => e.model.id == countedMenuItem.model.id);

    if (index != -1) {
      if (countedMenuItem.count == 0) {
        _menuItems.removeAt(index);
      } else {
        _menuItems[index].count = countedMenuItem.count;
      }
    } else {
      _menuItems.add(countedMenuItem);
    }
    notifyListeners();
  }

  void updatePromotion(CardPromotionsCountedModel countedPromotion) {
    final index =
        _promotions.indexWhere((e) => e.model.id == countedPromotion.model.id);

    if (index != -1) {
      if (countedPromotion.count == 0) {
        _promotions.removeAt(index);
      } else {
        _promotions[index].count = countedPromotion.count;
      }
    } else {
      _promotions.add(countedPromotion);
    }
    notifyListeners();
  }

  CardMenuItemsCountedModel? counterMenuItemBy(MenuItem menuItem) {
    final index = _menuItems.indexWhere((e) => e.model.id == menuItem.id);

    if (index == -1) return null;
    return _menuItems[index];
  }

  CardPromotionsCountedModel? counterPromotionItemBy(PromotionItem promotion) {
    final index = _promotions.indexWhere((e) => e.model.id == promotion.id);

    if (index == -1) return null;
    return _promotions[index];
  }
}
