import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';
import '../../standard/src/text.dart';

class SegmentedControl<T extends Object> extends StatelessWidget {
  final Map<T, Widget> children;
  final ValueChanged<T?> onValueChanged;
  final T? selected;

  const SegmentedControl({
    Key? key,
    required this.children,
    required this.onValueChanged,
    this.selected,
  }) : super(key: key);

  // static SegmentedControl<String> stringed(
  //   List<String> variants,
  //   String? selected,
  //   ValueChanged<String?> onValueChanged,
  // ) =>
  //     SegmentedControl<String>(
  //       selected: selected,
  //       onValueChanged: onValueChanged,
  //       children: {
  //         for (var v in variants.map((e) => MapEntry(e, _preparedText(e))))
  //           v.key: v.value
  //       },
  //     );

  static SegmentedControl<String> stringed(
      List<String> variants,
      String? selected,
      ValueChanged<String?> onValueChanged,
      ) =>
      mapped<String>(
        {for (var v in variants.map((e) => MapEntry(e, e))) v.key: v.value},
        selected,
            (value) {},
      );

  static SegmentedControl<T> mapped<T extends Object>(
      Map<T, String> variants,
      T? selected,
      ValueChanged<T?> onValueChanged,
      ) =>
      SegmentedControl<T>(
        selected: selected,
        onValueChanged: onValueChanged,
        children: variants.map(
              (key, value) => MapEntry(key, _preparedText(value)),
        ),
      );

  static Widget _preparedText(String title) => StandardText(
    title,
    textAlign: TextAlign.center,
  );

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return LayoutBuilder(builder: (context, constraints) {
      final childWidth = constraints.maxWidth / children.length;

      return CupertinoSlidingSegmentedControl<T>(
        backgroundColor: colorSet.secondary,
        thumbColor: colorSet.secondary2,
        padding: const EdgeInsets.all(4),
        children: children.map((key, value) => MapEntry(
            key,
            SizedBox(
              width: childWidth,
              child: value,
            ))),
        onValueChanged: onValueChanged,
        groupValue: selected,
      );
    });
  }
}
