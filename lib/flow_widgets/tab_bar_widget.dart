import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/colors_provider.dart';


// NOTE: It's base file

class TabBarWidgetModel {
  final int initialIndex;
  final List<TabBarScreenModel> screens;

  TabBarWidgetModel({this.initialIndex = 0, required this.screens});
}

class TabBarScreenModel {
  final BottomNavigationBarItem navBarItem;
  final Widget rootWidget;

  TabBarScreenModel({required this.navBarItem, required this.rootWidget});
}

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key, required this.model}) : super(key: key);

  final TabBarWidgetModel model;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  late final controller =
  CupertinoTabController(initialIndex: widget.model.initialIndex);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;
    return CupertinoTabScaffold(
      controller: controller,
      tabBar: CupertinoTabBar(
        items: widget.model.screens.map((e) => e.navBarItem).toList(),
        backgroundColor: colorSet.tabNavigation,
      ),
      tabBuilder: (context, index) => CupertinoTabView(
        builder: (context) => widget.model.screens[index].rootWidget,
      ),
    );
  }
}
