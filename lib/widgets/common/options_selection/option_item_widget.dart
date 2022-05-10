import 'package:flutter/material.dart';
import 'package:graduate_work/arch/utils.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';
import '../../custom/src/clipped_container.dart';
import '../../standard/src/text.dart';

class OptionItemWidget extends StatelessWidget {
  final String name;
  final double price;
  final bool isSelected;

  const OptionItemWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return ClipperContainer(
      color: colorSet.content,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: colorSet.separator, width: 0.2),
      height: 100,
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            Align(
              child: StandardText(name),
              alignment: Alignment.topLeft,
            ),
            Align(
              child: StandardText(defaultPriceFormat.format(price)),
              alignment: Alignment.bottomLeft,
            ),
            Visibility(
              visible: isSelected,
              child: Align(
                child: Icon(
                  Icons.done,
                  size: 30,
                  color: colorSet.primary,
                ),
                alignment: Alignment.bottomRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
