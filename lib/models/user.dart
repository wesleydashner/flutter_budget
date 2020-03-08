import 'package:budget/models/account.dart';
import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  final List<Account> accounts = [];

  void addAccount(String name) {
    this.accounts.add(Account(name: name));
    notifyListeners();
  }
}
