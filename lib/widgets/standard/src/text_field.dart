import 'package:flutter/material.dart';
import 'package:graduate_work/providers/colors_provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class StandardTextField extends StatelessWidget {
  final String? hintText;
  final void Function(String) onChange;
  final TextInputType? keyboardType;

  final MaskTextInputFormatter? maskFormatter;

  const StandardTextField({
    Key? key,
    this.hintText,
    this.maskFormatter,
    this.keyboardType,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return TextField(
      onChanged: onChange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        focusedBorder: _border(colorSet.primary),
        disabledBorder:
            _border(colorSet.primaryText.withOpacity(0.7), width: 1),
        enabledBorder: _border(colorSet.primaryText.withOpacity(0.7), width: 1),
        hintStyle: TextStyle(color: colorSet.primaryText.withOpacity(0.7)),
      ),
      style: TextStyle(color: colorSet.primaryText),
      inputFormatters: (maskFormatter != null) ? [maskFormatter!] : null,
    );
  }

  OutlineInputBorder _border(Color color, {double width = 2}) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
      );
}
