import 'package:flutter/material.dart';

import '../../../widgets/custom/custom.dart';
import '../../../widgets/standard/standard_widgets.dart';

class PromotionsItemWidget extends StatelessWidget {
  const PromotionsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipperContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      color: Colors.blue,
      height: 150,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          StandardText('Some title',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
