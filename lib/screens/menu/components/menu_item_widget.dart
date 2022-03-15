import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/menu_item.dart';
import '../../../providers/colors_provider.dart';
import '../../../widgets/custom/src/clipped_container.dart';
import '../../../widgets/standard/src/text.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const MenuItemWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  factory MenuItemWidget.fromModel(MenuItem model) {
    final priceFormatter = NumberFormat.currency(symbol: '\$')
      ..maximumFractionDigits = 2
      ..minimumFractionDigits = 0;

    return MenuItemWidget(
      title: model.name,
      description: model.description,
      price: priceFormatter.format(model.price),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return ClipperContainer(
      color: colorSet.content,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: colorSet.separator, width: 0.2),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 96, maxHeight: 96),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Just square
            AspectRatio(
              aspectRatio: 1 / 1,
              // TODO CHANGE CHILD TO IMAGE
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        StandardText(title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        const Spacer(),
                        StandardText(price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ],
                    ),
                    const SizedBox(height: 5),
                    StandardText(description, maxLines: 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
