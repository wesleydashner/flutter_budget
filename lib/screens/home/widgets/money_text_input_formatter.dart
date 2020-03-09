import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MoneyTextInputFormatter extends TextInputFormatter {
  // this works because default value in account card TextEditingController is 0.00
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // if backspace
    if (oldValue.text.substring(0, oldValue.text.length - 1) == newValue.text &&
        oldValue.text != '0.00') {
      return TextEditingValue(
        text: (double.parse(newValue.text) / 10).toStringAsFixed(2),
      );
    }
    return TextEditingValue(
      text: (double.parse(newValue.text) * 10).toStringAsFixed(2),
    );
  }
}
