import 'package:flutter/material.dart';

class Account extends ChangeNotifier {
  final String name;
  var _amount = 0.0;

  Account({
    @required this.name,
  });

  set amount(double v) {
    if (v != _amount) {
      _amount = v;
      notifyListeners();
    }
  }

  get amount => _amount;

  @override
  String toString() {
    return 'Account{name: $name, amount: $_amount}';
  }
}
