import 'package:flutter/material.dart';

import '../../models/menu_item.dart';
import '../../widgets/standard/standard_widgets.dart';
import 'components/menu_item_widget.dart';

class MenuRootScreen extends StatefulWidget {
  const MenuRootScreen({Key? key}) : super(key: key);

  @override
  _MenuRootScreenState createState() => _MenuRootScreenState();
}

class _MenuRootScreenState extends State<MenuRootScreen> {
  final List<MenuItem> menuItems = List<int>.generate(10, (i) => i + 1)
      .map((e) => MenuItem(
            e.toString(),
            'name' + e.toString(),
            'description ' * 10 + e.toString(),
            e.toDouble(),
            e.toString(),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return StandardScaffold.standardWithStandardAppBar(
      appBarTitle: 'Menu',
      context: context,
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        itemBuilder: (context, index) =>
            MenuItemWidget.fromModel(menuItems[index]),
        itemCount: menuItems.length,
      ),
    );
  }
}
