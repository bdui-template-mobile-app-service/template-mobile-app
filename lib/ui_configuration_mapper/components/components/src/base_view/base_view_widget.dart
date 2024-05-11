import 'package:flutter/widgets.dart';

import 'package:graduate_work/ui_configuration_mapper/components/core/component_facade.dart';
import 'package:graduate_work/styles/styles.dart';
import 'base_view_payload.dart';
import 'base_view_facade.dart';

class BaseViewWidget extends StatefulWidget {
  static final ComponentFacade facade = BaseViewFacade();

  final BaseViewPayload configurationPayload;
  final Map<String, dynamic> dataContext;
  // Это для обертки остальных вьюх в базовую (эту)
  final Widget? child;

  const BaseViewWidget({
    Key? key,
    required this.configurationPayload,
    required this.dataContext,
    this.child,
  }) : super(key: key);

  @override
  _BaseViewWidgetState createState() => _BaseViewWidgetState();
}

class _BaseViewWidgetState extends State<BaseViewWidget> {
  @override
  Widget build(BuildContext context) {
    final cp = widget.configurationPayload;

    Widget makeMainWidget() {
      return GestureDetector(
        onTap: cp.onTapAction,
        child: ClipperContainer(
          width: cp.width,
          height: cp.height,
          padding: cp.padding,
          margin: cp.margin,
          child: widget.child ?? cp.child?.makeWidget(widget.dataContext),
          color: cp.color?.toHexColor,
          borderRadius: (cp.cornerRadius != null)
              ? BorderRadius.circular(cp.cornerRadius!)
              : null,
        ),
      );
    }

    return (cp.width == double.infinity || cp.height == double.infinity)
        ? Expanded(child: makeMainWidget())
        : makeMainWidget();
  }
}

class ClipperContainer extends StatelessWidget {
  /// Container properties
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  /// Decoration properties
  final Color? color;
  final BoxBorder? border;
  final BorderRadius? borderRadius;

  const ClipperContainer({
    Key? key,
    this.child,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.color,
    this.border,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        color: color,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: child,
      ),
    );
  }
}
