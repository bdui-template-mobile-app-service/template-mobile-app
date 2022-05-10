import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graduate_work/arch/utils.dart';
import 'package:graduate_work/models/abstract_classes.dart';
import 'package:graduate_work/providers/card_provider.dart';
import 'package:graduate_work/screens/promotions/components/promotions_item_widget.dart';
import 'package:graduate_work/widgets/common/add_to_card_widget.dart';
import 'package:graduate_work/widgets/common/text_button.dart';
import 'package:graduate_work/widgets/standard/standard_widgets.dart';
import 'package:provider/provider.dart';

import '../../models/card.dart';
import '../menu/components/menu_item_widget.dart';
import 'confirm_card_order_screen.dart';

class CardRootScreen extends StatefulWidget {
  const CardRootScreen({Key? key}) : super(key: key);

  @override
  _CardRootScreenState createState() => _CardRootScreenState();
}

class _CardRootScreenState extends State<CardRootScreen> {
  @override
  Widget build(BuildContext context) {
    final cardProvider = context.watch<CardProvider>();

    return StandardScaffold.standardWithStandardAppBar(
      context: context,
      appBarTitle: 'Корзина',
      body: cardProvider.menuItems.isEmpty && cardProvider.promotions.isEmpty
          ? _buildEmptyPlaceholder()
          : _buildListView(context, cardProvider),
    );
  }

  Widget _buildEmptyPlaceholder() =>
      const Center(child: StandardText('В корзине ничего нет'));

  Widget _buildListView(
    BuildContext context,
    CardProvider cardProvider,
  ) =>
      Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(bottom: 65),
            children: [
              ..._menuItemOrders(cardProvider.menuItems),
              ..._promotionOrders(cardProvider.promotions),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: _buildSendOrderButton(
                context,
                cardProvider.menuItems,
                cardProvider.promotions,
              ),
            ),
          ),
        ],
      );

  List<Widget> _menuItemOrders(List<CardMenuItemModel> menuItems) {
    if (menuItems.isEmpty) return [];

    return [
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: StandardText(
          'Пукнты меню:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      ...menuItems.map(
        (e) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MenuItemWidget.fromModel(
              e.model,
              options: e.selectedOptions.toList(),
              replacingDescriptionWidget: Align(
                alignment: Alignment.centerRight,
                child: AddToCarWidget(
                  menuItem: e.model,
                  selectedOptions: e.selectedOptions,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _promotionOrders(List<CardPromotionModel> promotions) {
    if (promotions.isEmpty) return [];

    return [
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: StandardText(
          'Акции:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      ...promotions.map((e) => PromotionsItemWidget.fromModel(
            e.model,
            options: e.selectedOptions.toList(),
            additionalBottomWidget: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8),
                child: AddToCarWidget(
                  promotion: e.model,
                  selectedOptions: e.selectedOptions,
                ),
              ),
            ),
          )),
    ];
  }

  Widget _buildSendOrderButton(
    BuildContext context,
    List<CardMenuItemModel> menuItems,
    List<CardPromotionModel> promotions,
  ) {
    final sum = defaultPriceFormat.format(
        (menuItems.map((e) => _calculatePrice(e)).sum +
            promotions.map((e) => _calculatePrice(e)).sum));
    return CommonTextButton(
      title: 'Оформить ($sum)',
      onTap: () => _sendOrder(menuItems, promotions),
    );
  }

  double _calculatePrice(CardPositionItem cardPositionItem) =>
      cardPositionItem.count *
      (cardPositionItem.model.price +
          cardPositionItem.selectedOptions.map((e) => e.price).sum);

  void _sendOrder(
    List<CardMenuItemModel> menuItems,
    List<CardPromotionModel> promotions,
  ) {
    print(menuItems);
    print(promotions);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ConfirmCardOrderScreen(
          menuItems: menuItems,
          promotions: promotions,
        ),
      ),
    );
  }
}
