import 'package:budget/models/account.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final Account account;

  AccountCard({
    @required this.account,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = 80;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Text(
                account.name,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              height: buttonWidth,
              width: buttonWidth,
              child: FlatButton(
                child: Icon(
                  Icons.remove,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () => debugPrint('subtract'),
              ),
            ),
            Spacer(),
            Text(account.amount.toStringAsFixed(2),
                style: TextStyle(fontSize: 48)),
            Spacer(),
            Container(
              height: buttonWidth,
              width: buttonWidth,
              child: FlatButton(
                child: Icon(Icons.add, color: Theme.of(context).primaryColor),
                onPressed: () => debugPrint('add'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
