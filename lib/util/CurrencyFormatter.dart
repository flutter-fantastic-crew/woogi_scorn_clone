import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter extends TextInputFormatter {
  CurrencyFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int parsedValue = int.tryParse(newValue.text) ?? 0;
    final formatter = NumberFormat.simpleCurrency(locale: "ko");
    return TextEditingValue(text: formatter.format(parsedValue));
  }
}
