import 'package:flutter/material.dart';
import 'package:graduate_work/widgets/custom/custom.dart';
import 'package:provider/provider.dart';

import '../../../providers/colors_provider.dart';

class LogoWidget extends StatelessWidget {
  final String logoUrl;

  const LogoWidget({
    Key? key,
    required this.logoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return ClipperContainer(
      color: colorSet.content,
      border: Border.all(color: colorSet.separator, width: 0.2),
      borderRadius: BorderRadius.circular(100),
      width: 170,
      height: 170,
      child: Image.network(logoUrl),
    );
  }
}
