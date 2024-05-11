import 'package:flutter/widgets.dart';

import 'package:graduate_work/ui_configuration_mapper/components/components/base_view.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_facade.dart';

import 'image_view_payload.dart';
import 'image_view_facade.dart';

class ImageViewWidget extends StatefulWidget {
  static final ComponentFacade facade = ImageViewFacade();

  final ImageViewPayload configurationPayload;
  final Map<String, dynamic> dataContext;

  const ImageViewWidget({
    Key? key,
    required this.configurationPayload,
    required this.dataContext,
  }) : super(key: key);

  @override
  _ImageViewWidgetState createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseViewWidget(
      configurationPayload: widget.configurationPayload,
      dataContext: widget.dataContext,
      child: imageOfPlaceholder(),
    );
  }

  Widget? imageOfPlaceholder() {
    final src = imageSrc();

    if (src == null || src.isEmpty) {
      return null;
    }

    return Image.network(
      src,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  String? imageSrc() {
    final cp = widget.configurationPayload;

    if (cp.urlSource != null && widget.dataContext[cp.urlSource!] is String) {
      return widget.dataContext[cp.urlSource!];
    } else if (cp.url != null) {
      return cp.url!;
    } else {
      return "";
    }
  }
}
