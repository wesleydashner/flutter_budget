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
      accountCards.add(Dismissible(
        child: AccountCard(account: account),
        key: Key(account.databaseId.toString()),
        onDismissed: (direction) {
          user.removeAccount(account.databaseId);
        },
      ));
      accountCards.add(Divider(height: 0));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('accounts'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addAccount(user, context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: accountCards,
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
