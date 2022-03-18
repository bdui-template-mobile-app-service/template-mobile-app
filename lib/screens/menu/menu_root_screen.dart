import 'package:flutter/material.dart';
import 'package:graduate_work/networking/api/api.dart';
import 'package:graduate_work/screens/menu/components/menu_item_widget.dart';

import '../../models/menu_item.dart';
import '../../widgets/standard/standard_widgets.dart';

class MenuRootScreen extends StatefulWidget {
  const MenuRootScreen({Key? key}) : super(key: key);

  @override
  _MenuRootScreenState createState() => _MenuRootScreenState();
}

class _MenuRootScreenState extends State<MenuRootScreen> {
  @override
  Widget build(BuildContext context) {
    return StandardScaffold.standardWithStandardAppBar(
      appBarTitle: 'Menu',
      context: context,
      body: FutureBuilder<List<MenuItem>?>(
        future: fetchMenuItems(),
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

  Widget _buildListView(List<MenuItem> menuItems) => ListView.builder(
        itemBuilder: (context, index) =>
            MenuItemWidget.fromModel(menuItems[index]),
        itemCount: menuItems.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
      );

  Future<List<MenuItem>?> fetchMenuItems() async {
    try {
      final items = await RestClient.shared.fetchMenuItems();
      return items;
    } catch (error) {
      return [];
    }
  }
}
