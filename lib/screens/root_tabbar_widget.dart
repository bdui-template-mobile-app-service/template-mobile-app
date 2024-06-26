import 'package:flutter/material.dart';
import 'package:graduate_work/screens/about_company/about_company_root_screen.dart';
import 'package:graduate_work/screens/card/card_root_screen.dart';
import 'package:provider/provider.dart';

import '../flow_widgets/tab_bar_widget.dart';
import '../providers/colors_provider.dart';
import '../widgets/standard/standard_widgets.dart';
import 'menu/menu_root_screen.dart';
import 'promotions/promotions_root_screen.dart';

class RootTabBarWidget extends StatefulWidget {
  const RootTabBarWidget({Key? key}) : super(key: key);

  @override
  _RootTabBarWidgetState createState() => _RootTabBarWidgetState();
}

class _RootTabBarWidgetState extends State<RootTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      model: TabBarWidgetModel(
        initialIndex: 1,
        screens: tabScreens(),
      ),
    );
  }

  List<TabBarScreenModel> tabScreens() {
    // Here check flags from server and show only allowed modules
    return [
      TabBarScreenModel(
        navBarItem: const BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted),
          label: 'Услуги',
        ),
        rootWidget: const MenuRootScreen(),
      ),
      TabBarScreenModel(
        navBarItem: const BottomNavigationBarItem(
          icon: Icon(Icons.whatshot),
          label: 'Акции',
        ),
        rootWidget: const PromotionsScreen(),
      ),
      TabBarScreenModel(
        navBarItem: const BottomNavigationBarItem(
          icon: Icon(Icons.wallet_giftcard),
          label: 'Заказ',
        ),
        rootWidget: const CardRootScreen(),
      ),
      TabBarScreenModel(
        navBarItem: const BottomNavigationBarItem(
            icon: Icon(Icons.factory), label: 'Инфо'),
        rootWidget: const AboutCompanyRootScreen(),
      )
    ];
  }
}

class LolKek2 extends StatefulWidget {
  const LolKek2({Key? key}) : super(key: key);

  @override
  _LolKek2State createState() => _LolKek2State();
}

class _LolKek2State extends State<LolKek2> {
  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;
    return StandardScaffold.standard(
      context: context,
      appBar: StandardAppBar.standard(context: context, title: Text('lolkek')),
      body: Center(
        child: Column(
          children: [
            Container(height: 300, color: colorSet.background),
          ],
        ),
      ),
    );
  }
}
