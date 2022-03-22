import 'package:flutter/material.dart';
import 'package:graduate_work/providers/card_provider.dart';
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
      appBarTitle: 'appBarTitle',
      body: cardProvider.menuItems.isEmpty && cardProvider.promotions.isEmpty
          ? _buildEmptyPlaceholder()
          : _buildListView(cardProvider),
    );
  }

  Widget _buildEmptyPlaceholder() =>
      const Center(child: StandardText('В корзине ничего нет'));

  Widget _buildListView(CardProvider cardProvider) => ListView(
        children: [
          ..._menuItemOrders(cardProvider.menuItems),
          ..._promotionOrders(cardProvider.promotions),
        ],
      );

  List<Widget> _menuItemOrders(List<CardMenuItemsCountedModel> menuItems) {
    if (menuItems.isEmpty) return [];

    return [
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: StandardText(
          'Пукнты меню:',
          style: TextStyle(fontSize: 18),
        ),
      ),
      ...menuItems.map((e) => Column(
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
          )),
    ];
  }

  List<Widget> _promotionOrders(List<CardPromotionsCountedModel> promotions) {
    if (promotions.isEmpty) return [];

    return [
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: StandardText(
          'Акции:',
          style: TextStyle(fontSize: 18),
        ),
      ),
      ...promotions.map((e) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PromotionsItemWidget.fromModel(
                e.model,
                additionalBottomWidget: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8, right: 8),
                    child: AddToCarWidget(promotion: e.model),
                  ),
                ),
              ),
            ],
          )),
    ];
  }
}
