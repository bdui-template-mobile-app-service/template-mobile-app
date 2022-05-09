import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graduate_work/models/menu_item.dart';
import 'package:graduate_work/models/option_item.dart';
import 'package:graduate_work/widgets/common/options_selection/options_selection_widget.dart';
import 'package:graduate_work/widgets/standard/standard_widgets.dart';

import '../../arch/utils.dart';
import '../../widgets/common/add_to_card_widget.dart';

class MenuDetailScreen extends StatefulWidget {
  final MenuItem menuItem;

  const MenuDetailScreen({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  @override
  _MenuDetailScreenState createState() => _MenuDetailScreenState();
}

// show snackBar:
//
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// content: Text('Yay! A SnackBar!'),
// ),
// );

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  Set<OptionItem> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return StandardScaffold.standardWithStandardAppBar(
      context: context,
      appBarTitle: 'Позиция',
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          Image.network(
            widget.menuItem.imageUrl,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(
              widget.menuItem.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(
              defaultPriceFormat.format(widget.menuItem.price),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(widget.menuItem.description),
          ),
          if (widget.menuItem.allowedOptions.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: _buildOptionsList(),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AddToCarWidget(
                menuItem: widget.menuItem,
                selectedOptions: selectedOptions,
                onlyTextStateAndShowSnack: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsList() => OptionSelectionWidget(
        allowedOptions: widget.menuItem.allowedOptions,
        onUpdateSelectedOptions: (newSelected) {
          setState(() {
            selectedOptions = newSelected;
          });
        },
      );
}
