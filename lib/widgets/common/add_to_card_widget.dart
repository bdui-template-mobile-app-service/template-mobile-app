import 'package:flutter/material.dart';
import 'package:graduate_work/models/menu_item.dart';
import 'package:graduate_work/models/promotion_item.dart';
import 'package:graduate_work/widgets/common/increment_decrement_button.dart';
import 'package:provider/provider.dart';

import '../../models/card.dart';
import '../../providers/card_provider.dart';

class AddToCarWidget extends StatefulWidget {
  // nonNull should be only one from them
  final PromotionItem? promotion;
  final MenuItem? menuItem;

  final Function(int)? onChangeValue;

  const AddToCarWidget({
    Key? key,
    this.promotion,
    this.menuItem,
    this.onChangeValue,
  })  : assert(
          (promotion == null && menuItem != null) ||
              (promotion != null && menuItem == null),
          'nonNull should be only one from promotion and menuItem',
        ),
        super(key: key);

  @override
  _AddToCarWidgetState createState() => _AddToCarWidgetState();
}

class _AddToCarWidgetState extends State<AddToCarWidget> {
  CardMenuItemModel? savedCountedMenuItems;
  CardPromotionModel? savedCountedPromotion;

  void updateCountedModels(BuildContext context) {
    final cardProvider = context.watch<CardProvider>();

    if (widget.menuItem != null) {
      savedCountedMenuItems = cardProvider.counterMenuItemBy(widget.menuItem!);
    }
    if (widget.promotion != null) {
      savedCountedPromotion =
          cardProvider.counterPromotionItemBy(widget.promotion!);
    }
  }

  int get currentValue {
    if (savedCountedMenuItems != null) return savedCountedMenuItems!.count;
    if (savedCountedPromotion != null) return savedCountedPromotion!.count;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    updateCountedModels(context);

    return IncrementDecrementButtons(
      value: currentValue,
      onIncrement: _incrementValue,
      onDecrement: _decrementValue,
    );
  }

  void _incrementValue() {
    _setCurrentValue(currentValue + 1);
  }

  void _decrementValue() {
    _setCurrentValue(currentValue - 1);
  }

  void _setCurrentValue(int value) {
    final cardProvider = context.read<CardProvider>();

    if (widget.menuItem != null) {
      cardProvider.updateMenuItem(
        CardMenuItemModel(widget.menuItem!, value),
      );
    }
    if (widget.promotion != null) {
      cardProvider.updatePromotion(
        CardPromotionModel(widget.promotion!, value),
      );
    }

    if (widget.onChangeValue != null) {
      widget.onChangeValue!(value);
    }
    setState(() {});
  }
}
