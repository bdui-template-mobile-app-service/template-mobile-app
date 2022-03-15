import 'package:flutter/material.dart';

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
        appBarTitle: 'Promotions',
        context: context,
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemBuilder: (context, index) => PromotionsItemWidget(),
          itemCount: 10,
        ));
  }
}
