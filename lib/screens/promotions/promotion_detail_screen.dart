import 'package:flutter/material.dart';
import 'package:graduate_work/arch/utils.dart';
import 'package:graduate_work/models/promotion_item.dart';
import 'package:graduate_work/screens/menu/components/menu_item_widget.dart';
import 'package:graduate_work/widgets/common/add_to_card_widget.dart';
import 'package:graduate_work/widgets/standard/src/scaffold.dart';
import 'package:graduate_work/widgets/standard/src/text.dart';

class PromotionDetailScreen extends StatefulWidget {
  final PromotionItem promotion;

  const PromotionDetailScreen({
    Key? key,
    required this.promotion,
  }) : super(key: key);

  @override
  _PromotionDetailScreenState createState() => _PromotionDetailScreenState();
}

class _PromotionDetailScreenState extends State<PromotionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return StandardScaffold.standardWithStandardAppBar(
      context: context,
      appBarTitle: 'Акция',
      body: ListView(
        children: [
          Image.network(
            widget.promotion.imageUrl,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(
              widget.promotion.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(
              defaultPriceFormat.format(widget.promotion.price),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AddToCarWidget(promotion: widget.promotion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(widget.promotion.description),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: StandardText('Входящие блюда:',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
          ),
          ...widget.promotion.menuItems.map((e) => MenuItemWidget.fromModel(e)),
        ],
      ),
    );
  }
}
