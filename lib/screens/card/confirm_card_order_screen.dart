import 'package:flutter/material.dart';
import 'package:graduate_work/providers/card_provider.dart';
import 'package:graduate_work/providers/colors_provider.dart';
import 'package:graduate_work/widgets/common/text_button.dart';
import 'package:graduate_work/widgets/standard/standard_widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';

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
  static final maskFormatterFilter = {
    "#": RegExp(r'[0-9]'),
  };
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: phoneMaskFormatterPattern,
    filter: maskFormatterFilter,
  );
  String phone = '';

  late TextEditingController _dateTimeController;

  @override
  void initState() {
    super.initState();
    _dateTimeController = TextEditingController();
  }

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
            child: DateTimePicker(
              type: DateTimePickerType.dateTime,
              dateMask: 'd MMMM, yyyy - hh:mm a',
              controller: _dateTimeController,
              dateLabelText: 'Предпочитаемое время посещения',
              use24HourFormat: true,
              locale: const Locale('ru', 'RU'),
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
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
          _dateTimeController.text,
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
