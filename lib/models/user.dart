import 'package:budget/database/database_helper.dart';
import 'package:budget/models/account.dart';
import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  final List<Account> accounts = [];
  final db = DatabaseHelper.instance;

  User() {
    userConstructor();
  }

  void userConstructor() async {
    List<Map<String, dynamic>> fromDB = await db.queryAllRows();
    for (final row in fromDB) {
      final account = Account(name: row['name'], databaseId: row['id']);
      account.amount = row['amount'];
      accounts.add(account);
    }
    notifyListeners();
  }

  void addAccount(String name) async {
    final id = await db.insert({'name': name, 'amount': 0});
    this.accounts.add(Account(name: name, databaseId: id));
    notifyListeners();
  }
}
