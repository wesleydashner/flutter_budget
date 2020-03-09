import 'package:budget/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(BudgetApp());

class BudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
