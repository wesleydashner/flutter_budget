import 'package:budget/models/account.dart';
import 'package:budget/screens/home/widgets/account_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final accounts = <Account>[
    Account(name: 'Investments', amount: 0),
    Account(name: 'Usable', amount: 141.39),
    Account(name: 'Taxes', amount: 42.5),
  ];

  @override
  Widget build(BuildContext context) {
    var accountCards = <Widget>[];
    for (final account in accounts) {
      accountCards.add(AccountCard(
        name: account.name,
        amount: account.amount,
      ));
      accountCards.add(Divider(height: 0));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
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
