import 'package:flutter/material.dart';
import 'package:projeto_moedas/components/grey_row.dart';
import 'package:projeto_moedas/screens/currency_screen.dart';

class EconomicIndexes extends StatefulWidget {
  @override
  _EconomicIndexesState createState() => _EconomicIndexesState();
}

class _EconomicIndexesState extends State<EconomicIndexes> {
  @override
  Widget build(BuildContext context) {
    return ListView(
    children: <Widget>[
      GreyRow("Gerais"),
      CurrencyScreen(),
      GreyRow("Agricultura"),
      CurrencyScreen(),
      GreyRow("Inflação"),
      GreyRow("Commodities"),
    ],
    );
  }
}
