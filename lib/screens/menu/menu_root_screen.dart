import 'package:flutter/material.dart';
import 'package:graduate_work/networking/api/api.dart';
import 'package:graduate_work/screens/menu/components/menu_item_widget.dart';
import 'package:graduate_work/screens/menu/menu_detail_screen.dart';
import 'package:grouped_list/grouped_list.dart';

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
      appBarTitle: 'Меню',
      context: context,
      body: FutureBuilder<List<MenuItem>?>(
        future: fetchMenuItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: StandardText('Ошибки загрузки'));
          }
          if (snapshot.data != null) {
            return _buildGroupedListView(snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // TODO: Тут не скролится, если слишком мало элементов (можно залезть в исходники и поудалять проперти из ListView.builder)
  Widget _buildGroupedListView(List<MenuItem> menuItems) =>
      GroupedListView<MenuItem, String>(
        padding: const EdgeInsets.symmetric(vertical: 8),
        elements: menuItems,
        itemBuilder: (context, menuItem) => GestureDetector(
          child: MenuItemWidget.fromModel(menuItem),
          onTap: () => _showDetail(context, menuItem),
        ),
        groupBy: (menuItem) => menuItem.type ?? "Остальные",
        groupSeparatorBuilder: (type) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: StandardText(
            type,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget _buildListView(List<MenuItem> menuItems) => ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          child: MenuItemWidget.fromModel(menuItems[index]),
          onTap: () => _showDetail(context, menuItems[index]),
        ),
        itemCount: menuItems.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
      );

  void _showDetail(BuildContext context, MenuItem menuItem) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MenuDetailScreen(menuItem: menuItem)),
    );
  }

  Future<List<MenuItem>?> fetchMenuItems() async {
    try {
      final items = await RestClient.shared.fetchMenuItems();
      return items;
    } catch (error) {
      return [];
    }
  }
}
