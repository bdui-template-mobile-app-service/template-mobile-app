import 'package:flutter/material.dart';
import 'package:graduate_work/arch/utils.dart';
import 'package:graduate_work/models/promotion_item.dart';

import '../../../widgets/custom/custom.dart';
import '../../../widgets/standard/standard_widgets.dart';

class PromotionsItemWidget extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final Color textColor;
  final Widget? additionalBottomWidget;

  const PromotionsItemWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.textColor,
    this.additionalBottomWidget,
  }) : super(key: key);

  factory PromotionsItemWidget.fromModel(
    PromotionItem model, {
    Widget? additionalBottomWidget,
  }) {
    return PromotionsItemWidget(
      title: model.name,
      imageUrl: model.imageUrl,
      textColor: model.textColor,
      price: defaultPriceFormat.format(model.price),
      additionalBottomWidget: additionalBottomWidget,
    );
  }

  @override
  State<PromotionsItemWidget> createState() => _PromotionsItemWidgetState();
}

class _PromotionsItemWidgetState extends State<PromotionsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipperContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                Row(
                  children: [
                    Expanded(
                      child: StandardText(widget.title,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: widget.textColor,
                          )),
                    ),
                    const SizedBox(width: 10),
                    StandardText(
                      widget.price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: widget.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.additionalBottomWidget != null)
            widget.additionalBottomWidget!,
        ],
      ),
    );
  }
}
