import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graduate_work/arch/utils.dart';
import 'package:graduate_work/providers/card_provider.dart';
import 'package:graduate_work/providers/colors_provider.dart';
import 'package:graduate_work/screens/menu/components/menu_item_widget.dart';
import 'package:graduate_work/screens/promotions/components/promotions_item_widget.dart';
import 'package:graduate_work/widgets/common/add_to_card_widget.dart';
import 'package:graduate_work/widgets/standard/src/text.dart';
import 'package:graduate_work/widgets/standard/standard_widgets.dart';
import 'package:provider/provider.dart';

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
              _buildResultSum(cardProvider.menuItems, cardProvider.promotions),
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

  List<Widget> _menuItemOrders(List<CardMenuItemsCountedModel> menuItems) {
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
              replacingDescriptionWidget: Align(
                alignment: Alignment.centerRight,
                child: AddToCarWidget(menuItem: e.model),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _promotionOrders(List<CardPromotionsCountedModel> promotions) {
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
            additionalBottomWidget: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8),
                child: AddToCarWidget(promotion: e.model),
              ),
            ),
          )),
    ];
  }

  Widget _buildResultSum(
    List<CardMenuItemsCountedModel> menuItems,
    List<CardPromotionsCountedModel> promotions,
  ) {
    final sum = defaultPriceFormat.format(
        (menuItems.map((e) => e.count * e.model.price).sum +
            promotions.map((e) => e.count * e.model.price).sum));
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          StandardText(
            'Итоговая сумма: $sum',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _buildSendOrderButton(
    BuildContext context,
    List<CardMenuItemsCountedModel> menuItems,
    List<CardPromotionsCountedModel> promotions,
  ) =>
      GestureDetector(
        onTap: () => _sendOrder(menuItems, promotions),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: context.watch<ColorsProvider>().colorSet.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: StandardText(
              'Оформить',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );

  void _sendOrder(
    List<CardMenuItemsCountedModel> menuItems,
    List<CardPromotionsCountedModel> promotions,
  ) {
    print(menuItems);
    print(promotions);
  }
}
