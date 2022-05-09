import 'package:flutter/material.dart';
import 'package:graduate_work/models/option_item.dart';

import '../../standard/src/text.dart';
import 'option_item_widget.dart';

class OptionSelectionWidget extends StatefulWidget {
  final List<OptionItem> allowedOptions;
  final Function(Set<OptionItem>) onUpdateSelectedOptions;

  const OptionSelectionWidget({
    Key? key,
    required this.allowedOptions,
    required this.onUpdateSelectedOptions,
  }) : super(key: key);

  @override
  _OptionSelectionWidgetState createState() => _OptionSelectionWidgetState();
}

class _OptionSelectionWidgetState extends State<OptionSelectionWidget> {
  Set<OptionItem> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: StandardText(
            "Добавки на выбор:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 100 + 20,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final option = widget.allowedOptions[index];
              return GestureDetector(
                onTap: () => didTapOptionItem(atIndex: index),
                child: OptionItemWidget(
                  name: option.name,
                  isSelected: selectedOptions.contains(option),
                ),
              );
            },
            itemCount: widget.allowedOptions.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }

  void didTapOptionItem({required int atIndex}) {
    final option = widget.allowedOptions[atIndex];

    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }

    setState(() {});

    widget.onUpdateSelectedOptions(selectedOptions.map((e) => e).toSet());
  }
}
