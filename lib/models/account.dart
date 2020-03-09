import 'package:budget/database/database_helper.dart';
import 'package:flutter/material.dart';

class Account extends ChangeNotifier {
  final String name;
  final int databaseId;
  var _amount = 0.0;

  Account({
    @required this.name,
    @required this.databaseId,
  });

  set amount(double v) {
    if (v != _amount) {
      _amount = v;
      final db = DatabaseHelper.instance;
      db.update({
        DatabaseHelper.columnId: databaseId,
        DatabaseHelper.columnName: name,
        DatabaseHelper.columnAmount: v
      });
      notifyListeners();
    }
  }

  get amount => _amount;

  @override
  String toString() {
    return 'Account{name: $name, amount: $_amount}';
  }
}
