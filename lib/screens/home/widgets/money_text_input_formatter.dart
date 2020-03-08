import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MoneyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // this works because default value in account card TextEditingController is 0.00
    return TextEditingValue(
      text: (double.parse(newValue.text) * 10).toStringAsFixed(2),
    );
  }
}
