import 'package:flutter/material.dart';
import 'package:graduate_work/models/menu_item.dart';
import 'package:graduate_work/widgets/standard/standard_widgets.dart';

import '../../arch/utils.dart';
import '../../widgets/common/add_to_card_widget.dart';

class MenuDetailScreen extends StatefulWidget {
  final MenuItem menuItem;

  const MenuDetailScreen({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  @override
  _MenuDetailScreenState createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return StandardScaffold.standardWithStandardAppBar(
      context: context,
      appBarTitle: 'Позиция',
      body: ListView(
        children: [
          Image.network(
            widget.menuItem.imageUrl,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(
              widget.menuItem.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(
              defaultPriceFormat.format(widget.menuItem.price),
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
              child: AddToCarWidget(menuItem: widget.menuItem),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(widget.menuItem.description),
          ),
        ],
      ),
    );
  }
}
