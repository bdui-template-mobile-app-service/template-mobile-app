import 'package:flutter/material.dart';
import 'package:graduate_work/models/promotion_item.dart';

import '../../../widgets/custom/custom.dart';
import '../../../widgets/standard/standard_widgets.dart';

class PromotionsItemWidget extends StatefulWidget {
  final String title;
  final String imageUrl;
  final Color textColor;

  const PromotionsItemWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.textColor,
  }) : super(key: key);

  factory PromotionsItemWidget.fromModel(PromotionItem model) =>
      PromotionsItemWidget(
        title: model.name,
        imageUrl: model.imageUrl,
        textColor: model.textColor,
      );

  @override
  State<PromotionsItemWidget> createState() => _PromotionsItemWidgetState();
}

class _PromotionsItemWidgetState extends State<PromotionsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipperContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.blue,
      height: 150,
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                StandardText(widget.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: widget.textColor,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
