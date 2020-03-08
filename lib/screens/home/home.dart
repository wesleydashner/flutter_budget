import 'package:budget/models/user.dart';
import 'package:budget/screens/home/widgets/account_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => User(),
      child: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    var accountCards = <Widget>[];
    for (final account in user.accounts) {
      accountCards.add(AccountCard(account: account));
      accountCards.add(Divider(height: 0));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('accounts'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.add,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            onPressed: () => _addAccount(user, context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[...accountCards],
        ),
      ),
    );
  }

  void _addAccount(User user, BuildContext context) async {
    final v = await _createAlertDialog(context);
    if (v != '' && v != null) {
      user.addAccount(v);
    }
  }

  Future<String> _createAlertDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('new account'),
          content: TextField(
            autofocus: true,
            controller: textEditingController,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            FlatButton(
              child: Text('add'),
              onPressed: () {
                Navigator.of(context)
                    .pop(textEditingController.text.toString());
              },
            )
          ],
        );
      },
    );
  }
}
