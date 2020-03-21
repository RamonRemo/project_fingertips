import 'package:flutter/material.dart';
import 'package:projeto_moedas/components/CustomGrid.dart';
import 'package:projeto_moedas/components/money_card3.dart';


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
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Text("CryptoMoedas")),
                Tab(icon: Text("Moedas")),
                Tab(icon: Text("Indices")),
                Tab(icon: Text("Mercado")),
                Tab(icon: Text("Ações")),
              ],
            ),
            title: Text('Rafeles Dinheirator'),
          ),
          body: TabBarView(
            children: [
              Scaffold(
                body: CustomGrid(),
              ),
              MoneyCard3(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
