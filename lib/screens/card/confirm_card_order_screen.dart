import 'package:flutter/material.dart';
import 'package:graduate_work/providers/card_provider.dart';
import 'package:graduate_work/widgets/common/text_button.dart';
import 'package:graduate_work/widgets/standard/standard_widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../models/card.dart';
import '../../networking/api/api.dart';

class ConfirmCardOrderScreen extends StatefulWidget {
  final List<CardMenuItemModel> menuItems;
  final List<CardPromotionModel> promotions;

  const ConfirmCardOrderScreen({
    Key? key,
    required this.menuItems,
    required this.promotions,
  }) : super(key: key);

  @override
  _ConfirmCardOrderScreenState createState() => _ConfirmCardOrderScreenState();
}

class _ConfirmCardOrderScreenState extends State<ConfirmCardOrderScreen> {
  static const phoneMaskFormatterPattern = "+# (###) ###-##-##";
  static const timeMaskFormatterPattern = "##:##";
  static final maskFormatterFilter = {
    "#": RegExp(r'[0-9]'),
  };

  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: phoneMaskFormatterPattern,
    filter: maskFormatterFilter,
  );
  final timeMaskFormatter = MaskTextInputFormatter(
    mask: timeMaskFormatterPattern,
    filter: maskFormatterFilter,
  );

  String phone = '';
  String time = '';

  @override
  Widget build(BuildContext context) {
    return StandardScaffold.standardWithStandardAppBar(
      context: context,
      appBarTitle: 'Подтверждение',
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardText(
              'Для подтверждения заказа введите номер телефона и желаемое время посещения',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardTextField(
              keyboardType: TextInputType.number,
              hintText: 'Номер телефона',
              onChange: (i) => phone = i,
              maskFormatter: phoneMaskFormatter,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: StandardTextField(
              keyboardType: TextInputType.number,
              hintText: 'Предпочитаемое время посещения',
              onChange: (i) => time = i,
              maskFormatter: timeMaskFormatter,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: CommonTextButton(
              title: 'Оформить',
              onTap: () => _sendOrder(context),
            ),
          ),
        ],
      ),
    );
  }

  void _sendOrder(BuildContext context) async {
    try {
      final response = await RestClient.shared.postCardOrder(
        CardOrderModel(
          time,
          phone,
          widget.menuItems,
          widget.promotions,
        ),
      );
      _showAlertWithTitle('Заказ оформлен, ожидайте звонка');
      context.read<CardProvider>().removeAll();
      Navigator.of(context).pop();
    } catch (error) {
      print(error);
      _showAlertWithTitle('Произошла ошибка');
    }
  }

  void _showAlertWithTitle(String title) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
