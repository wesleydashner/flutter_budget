import 'package:budget/models/account.dart';
import 'package:budget/screens/home/widgets/money_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AccountCard extends StatelessWidget {
  final Account account;

  AccountCard({
    @required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => account,
      child: _AccountCard(account: account),
    );
  }
}

class _AccountCard extends StatelessWidget {
  final Account account;

  _AccountCard({
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
                onPressed: () => _subtractPressed(context),
              ),
            ),
            Spacer(),
            Consumer<Account>(
                builder: (context, account, child) => Text(
                    account.amount.toStringAsFixed(2),
                    style: TextStyle(fontSize: 48))),
            Spacer(),
            Container(
              height: buttonWidth,
              width: buttonWidth,
              child: FlatButton(
                child: Icon(Icons.add, color: Theme.of(context).primaryColor),
                onPressed: () => _addPressed(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _addPressed(BuildContext context) async {
    final v = await _createAlertDialog('add', context);
    if (v != null) {
      account.amount += double.parse(v);
    }
  }

  void _subtractPressed(BuildContext context) async {
    final v = await _createAlertDialog('subtract', context);
    if (v != null) {
      account.amount -= double.parse(v);
    }
  }

  Future<String> _createAlertDialog(String title, BuildContext context) {
    TextEditingController textEditingController =
        TextEditingController(text: '0.00');

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              controller: textEditingController,
              inputFormatters: <TextInputFormatter>[MoneyTextInputFormatter()],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop(null);
                },
              ),
              FlatButton(
                child: Text(title),
                onPressed: () {
                  Navigator.of(context)
                      .pop(textEditingController.text.toString());
                },
              )
            ],
          );
        });
  }
}
