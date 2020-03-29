import 'package:flutter/material.dart';
import 'package:projeto_moedas/components/CustomGrid.dart';
import 'package:projeto_moedas/screens/crypto_currency.dart';
import 'package:projeto_moedas/screens/currency_screen.dart';
import 'package:projeto_moedas/screens/interests_rates_screen.dart';

import 'screens/economic_indexes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Text("Currency")),
                Tab(icon: Text("CryptoCurrency")),
                Tab(icon: Text("EconomicIndex")),
                Tab(icon: Text("InterestRate")),
                Tab(icon: Text("Stock")),
              ],
            ),
            title: Text('Rafeles Dinheirator'),
          ),
          body: TabBarView(
            children: [
              CurrencyScreen(),
              CryptoCurrency(),
              EconomicIndexes(),
              InterestRates(),
              Icon(Icons.directions_bike, size: 90),
            ],
          ),
        ),
      ),
    );
  }
}
