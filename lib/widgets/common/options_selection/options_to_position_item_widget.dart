import 'package:flutter/material.dart';
import 'package:graduate_work/arch/utils.dart';
import 'package:graduate_work/providers/colors_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/option_item.dart';
import '../../standard/src/text.dart';

class OptionsToPositionItemWidget extends StatelessWidget {
  final List<OptionItem> options;

  const OptionsToPositionItemWidget({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 2, color: colorSet.separator),
          const SizedBox(height: 8),
          ...options
              .map((e) => StandardText(
                  '+ ${e.name} ${defaultPriceFormat.format(e.price)}'))
              .toList(),
        ],
      ),
    );
  }
}
