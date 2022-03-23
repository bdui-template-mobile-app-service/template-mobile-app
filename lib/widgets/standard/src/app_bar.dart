import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';

extension StandardAppBar on AppBar {
  static AppBar standard({
    required BuildContext context,
    required Widget title,
    List<Widget>? actions,
  }) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    final backgroundColor = colorSet.barNavigation;
    final foregroundColor = (backgroundColor.computeLuminance() > 0.4)
        ? Colors.black
        : Colors.white;
    return AppBar(
      title: title,
      actions: actions,
      bottom: _SeparatorWidget(height: 0.3, color: colorSet.separator),
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      elevation: 0,
    );
  }
}

class _SeparatorWidget extends PreferredSize {
  _SeparatorWidget({
    required double height,
    required Color color,
  }) : super(
          child: Container(color: color, height: height),
          preferredSize: Size.fromHeight(height),
        );
}
