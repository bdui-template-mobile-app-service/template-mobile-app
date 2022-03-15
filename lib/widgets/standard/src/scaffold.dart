import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';
import 'app_bar.dart';
import 'text.dart';

extension StandardScaffold on Scaffold {
  static Scaffold standardWithStandardAppBar({
    required BuildContext context,
    required Widget body,
    required String appBarTitle,
  }) =>
      standard(
        context: context,
        body: body,
        appBar: StandardAppBar.standard(
          context: context,
          title: StandardText(appBarTitle),
        ),
      );

  static Scaffold standard({
    required BuildContext context,
    required Widget body,
    PreferredSizeWidget? appBar,
  }) {
    final colorSet = context.watch<ColorsProvider>().colorSet;
    return Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: colorSet.background,
    );
  }
}
