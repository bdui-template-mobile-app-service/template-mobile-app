import 'package:flutter/material.dart';
import 'package:graduate_work/providers/colors_provider.dart';
import 'package:provider/provider.dart';

import '../standard/src/text.dart';

class CommonTextButton extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const CommonTextButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: colorSet.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: StandardText(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
