import 'package:flutter/material.dart';
import 'package:graduate_work/arch/utils.dart';
import 'package:graduate_work/models/option_item.dart';
import 'package:graduate_work/models/promotion_item.dart';
import 'package:graduate_work/widgets/common/options_selection/options_to_position_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';
import '../../../widgets/custom/custom.dart';
import '../../../widgets/standard/standard_widgets.dart';

class PromotionsItemWidget extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final Color textColor;
  final List<OptionItem>? options;
  final Widget? additionalBottomWidget;

  const PromotionsItemWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.textColor,
    this.options,
    this.additionalBottomWidget,
  }) : super(key: key);

  factory PromotionsItemWidget.fromModel(
    PromotionItem model, {
    List<OptionItem>? options,
    Widget? additionalBottomWidget,
  }) {
    return PromotionsItemWidget(
      title: model.name,
      imageUrl: model.imageUrl,
      textColor: model.textColor,
      price: defaultPriceFormat.format(model.price),
      options: options,
      additionalBottomWidget: additionalBottomWidget,
    );
  }

  @override
  State<PromotionsItemWidget> createState() => _PromotionsItemWidgetState();
}

class _PromotionsItemWidgetState extends State<PromotionsItemWidget> {
  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return ClipperContainer(
      color: colorSet.content,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: colorSet.separator, width: 0.2),
      child: Column(
        children: [
          SizedBox(
            height: 150,
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
          ),
          if (widget.options != null && widget.options!.isNotEmpty)
            OptionsToPositionItemWidget(options: widget.options!),
        ],
      ),
    );
  }
}
