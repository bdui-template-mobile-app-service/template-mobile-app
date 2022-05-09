import 'package:flutter/material.dart';
import 'package:graduate_work/models/menu_item.dart';
import 'package:graduate_work/models/option_item.dart';
import 'package:graduate_work/models/promotion_item.dart';
import 'package:provider/provider.dart';

import '../../models/card.dart';
import '../../providers/card_provider.dart';
import 'increment_decrement_button.dart';

class AddToCarWidget extends StatefulWidget {
  // nonNull should be only one from them
  final PromotionItem? promotion;
  final MenuItem? menuItem;
  // should be nonNull always
  final Set<OptionItem> selectedOptions;
  final bool onlyTextStateAndShowSnack;

  final Function(int)? onChangeValue;

  const AddToCarWidget({
    Key? key,
    this.promotion,
    this.menuItem,
    this.onlyTextStateAndShowSnack = false,
    required this.selectedOptions,
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
      savedCountedMenuItems = cardProvider.cardMenuItemModelBy(
          widget.menuItem!, widget.selectedOptions);
    }
    if (widget.promotion != null) {
      savedCountedPromotion = cardProvider.cardPromotionModelBy(
          widget.promotion!, widget.selectedOptions);
    }
  }

  int get currentValue {
    if (savedCountedMenuItems != null) return savedCountedMenuItems!.count;
    if (savedCountedPromotion != null) return savedCountedPromotion!.count;
    return 0;
  }

  String get _currentName {
    if (widget.promotion != null) return widget.promotion!.name;
    if (widget.menuItem != null) return widget.menuItem!.name;
    return "";
  }

  @override
  Widget build(BuildContext context) {
    updateCountedModels(context);

    return IncrementDecrementButtons(
      value: currentValue,
      onlyTextStateAndShowSnack: widget.onlyTextStateAndShowSnack,
      onIncrement: _incrementValue,
      onDecrement: _decrementValue,
    );
  }

  void _incrementValue() {
    final cardProvider = context.read<CardProvider>();

    if (widget.menuItem != null) {
      cardProvider.addMenuItem(widget.menuItem!, widget.selectedOptions);
    }
    if (widget.promotion != null) {
      cardProvider.addPromotion(widget.promotion!, widget.selectedOptions);
    }

    setState(() {});

    if (widget.onlyTextStateAndShowSnack) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Добавлено: $_currentName"),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  void _decrementValue() {
    final cardProvider = context.read<CardProvider>();

    if (widget.menuItem != null) {
      cardProvider.deleteOneMenuItem(widget.menuItem!, widget.selectedOptions);
    }
    if (widget.promotion != null) {
      cardProvider.deleteOnePromotion(
          widget.promotion!, widget.selectedOptions);
    }

    setState(() {});
  }

  // void _setCurrentValue(int value) {
  //   final cardProvider = context.read<CardProvider>();
  //
  //   if (widget.menuItem != null) {
  //     cardProvider.updateMenuItem(
  //       CardMenuItemModel(widget.menuItem!, widget.selectedOptions, value),
  //     );
  //   }
  //   if (widget.promotion != null) {
  //     cardProvider.updatePromotion(
  //       CardPromotionModel(widget.promotion!, widget.selectedOptions, value),
  //     );
  //   }
  //
  //   if (widget.onChangeValue != null) {
  //     widget.onChangeValue!(value);
  //   }
  //   setState(() {});
  // }
}
