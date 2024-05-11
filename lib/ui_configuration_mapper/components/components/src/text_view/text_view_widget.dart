import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:graduate_work/ui_configuration_mapper/components/components/base_view.dart';
import 'package:graduate_work/styles/styles.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_facade.dart';
import 'text_view_payload.dart';
import 'text_view_facade.dart';

class TextViewWidget extends StatefulWidget {
  static final ComponentFacade facade = TextViewFacade();

  final TextViewPayload configurationPayload;
  final Map<String, dynamic> dataContext;

  const TextViewWidget({
    Key? key,
    required this.configurationPayload,
    required this.dataContext,
  }) : super(key: key);

  @override
  _TextViewWidgetState createState() => _TextViewWidgetState();
}

class _TextViewWidgetState extends State<TextViewWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseViewWidget(
      configurationPayload: widget.configurationPayload,
      dataContext: widget.dataContext,
      child: Text(
        text(),
        textAlign: widget.configurationPayload.textAlign ?? TextAlign.left,
        style: TextStyle(
          color: widget.configurationPayload.textColor.toHexColor,
          fontSize: widget.configurationPayload.textSize,
          fontWeight: widget.configurationPayload.isBold
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }

  String text() {
    final cp = widget.configurationPayload;
    if (cp.textSource != null) {
      if (widget.dataContext[cp.textSource] is String) {
        return widget.dataContext[cp.textSource] as String;
      }
      return "###" + cp.textSource!;
    }
    if (cp.text != null) {
      return cp.text!;
    }
    return "TEXT_NOT_FOUND";
  }
}
