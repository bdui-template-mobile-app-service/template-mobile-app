import 'package:flutter/material.dart';
import 'package:graduate_work/networking/api/api.dart';
import 'package:graduate_work/screens/root_tabbar_widget.dart';

import 'root_state_widgets/top_level_providers.dart';
import 'root_state_widgets/widgets_binding_handler.dart';

void main() {
  lolKek();

  runApp(const TopLevelProviders(
    child: WidgetsBindingHandler(
      child: MyApp(),
    ),
  ));
}

void lolKek() async {
  RestClient.shared
      .fetchMenuItems()
      .then((value) => value.forEach((element) {
            print(element.name);
          }))
      .catchError((error) => print(error));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Best template',
      debugShowCheckedModeBanner: false,
      home: RootTabBarWidget(),
    );
  }
}
