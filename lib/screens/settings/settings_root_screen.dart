import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/colors_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/custom/custom.dart';
import '../../widgets/standard/standard_widgets.dart';

class SettingsRootScreen extends StatefulWidget {
  const SettingsRootScreen({Key? key}) : super(key: key);

  @override
  _SettingsRootScreenState createState() => _SettingsRootScreenState();
}

class _SectionedButtonModel {
  final String title;
  final void Function() onTap;
  _SectionedButtonModel(this.title, this.onTap);
}

class _SettingsRootScreenState extends State<SettingsRootScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedThemeMode =
        context.watch<ThemeProvider>().rawCurrentThemeMode;

    return StandardScaffold.standard(
      context: context,
      appBar: StandardAppBar.standard(
        context: context,
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          widgetWithTitle(
            context,
            'Theme mode',
            SegmentedControl.mapped<ThemeMode>(
              {
                ThemeMode.system: 'System',
                ThemeMode.light: 'Light',
                ThemeMode.dark: 'Dark',
              },
              selectedThemeMode,
                  (value) {
                if (value != null) {
                  context.read<ThemeProvider>().setThemeMode(value);
                  setState(() {});
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void _open(Widget Function(BuildContext) builder) =>
      Navigator.of(context).push(MaterialPageRoute(builder: builder));

  static Widget buttonsSection(
      BuildContext context,
      String title,
      List<_SectionedButtonModel> buttons,
      ) {
    final colorSet = context.watch<ColorsProvider>().colorSet;
    return section(
      context,
      title,
      buttons
          .map((model) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: model.onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            StandardText(
              model.title,
              textAlign: TextAlign.start,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_sharp, size: 15),
          ]),
        ),
      ))
          .toList(),
    );
  }

  static Widget section(
      BuildContext context,
      String title,
      List<Widget> children,
      ) {
    final colorSet = context.watch<ColorsProvider>().colorSet;
    return widgetWithTitle(
      context,
      title,
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorSet.content,
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }

  static Widget widgetWithTitle(
      BuildContext context,
      String title,
      Widget child,
      ) {
    final colorSet = context.watch<ColorsProvider>().colorSet;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: StandardText(
            title,
            replaceTextColorToStandard: false,
            style: TextStyle(
                color: colorSet.secondaryText, fontWeight: FontWeight.bold),
          ),
        ),
        child,
      ],
    );
  }
}
