import 'package:budget/models/account.dart';
import 'package:budget/models/user.dart';
import 'package:budget/screens/home/widgets/account_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final user = User(accounts: <Account>[
    Account(name: 'investments', amount: 0),
    Account(name: 'usable', amount: 141.39),
    Account(name: 'taxes', amount: 42.5),
  ]);

  @override
  Widget build(BuildContext context) {
    var accountCards = <Widget>[];
    for (final account in user.accounts) {
      accountCards.add(AccountCard(account: account));
      accountCards.add(Divider(height: 0));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('accounts'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[...accountCards],
        ),
      ),
    );
  }
}
