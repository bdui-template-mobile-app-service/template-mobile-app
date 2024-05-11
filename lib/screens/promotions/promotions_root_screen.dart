import 'package:flutter/material.dart';
import 'package:graduate_work/networking/api/api.dart';
import 'package:graduate_work/screens/promotions/promotion_detail_screen.dart';

import '../../models/promotion_item.dart';
import '../../widgets/standard/standard_widgets.dart';
import 'components/promotions_item_widget.dart';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({Key? key}) : super(key: key);

  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  @override
  Widget build(BuildContext context) {
    return StandardScaffold.standardWithStandardAppBar(
      appBarTitle: 'Акции',
      context: context,
      body: FutureBuilder<List<PromotionItem>?>(
        future: _fetchPromotions(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: StandardText('Ошибки загрузки'));
          }
          if (snapshot.data != null) {
            return _buildListView(snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildListView(List<PromotionItem> promotions) => ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          child: PromotionsItemWidget.fromModel(promotions[index]),
          onTap: () => _showDetailPromotion(context, promotions[index]),
        ),
        itemCount: promotions.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
      );

  void _showDetailPromotion(BuildContext context, PromotionItem promotion) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => PromotionDetailScreen(promotion: promotion)),
    );
  }

  Future<List<PromotionItem>> _fetchPromotions() async {
    try {
      final items = await RestClient.shared.fetchPromotions();
      return items;
    } catch (error) {
      return [];
    }
  }
}
