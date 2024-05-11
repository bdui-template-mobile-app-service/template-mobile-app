import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';

import 'stack_view_facade.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_facade.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components/stack_view.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components/base_view.dart';

class StackViewWidget extends StatefulWidget {
  static final ComponentFacade facade = StackViewFacade();

  final StackViewPayload configurationPayload;
  final Map<String, dynamic> dataContext;

  const StackViewWidget({
    Key? key,
    required this.configurationPayload,
    required this.dataContext,
  }) : super(key: key);

  @override
  _StackViewWidgetState createState() => _StackViewWidgetState();
}

class _StackViewWidgetState extends State<StackViewWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseViewWidget(
      configurationPayload: widget.configurationPayload,
      dataContext: widget.dataContext,
      child: _makeStack(),
    );
  }

  Widget _makeStack() {
    final List<Widget> children = widget.configurationPayload.children
        .map((childConfiguration) =>
            childConfiguration.makeWidget(widget.dataContext))
        .whereNotNull()
        .toList();

    if (widget.configurationPayload.axis == StackViewWidgetAxis.vertical) {
      return Column(
        children: children,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      );
    } else {
      return Row(
        children: children,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      );
    }
  }
}
