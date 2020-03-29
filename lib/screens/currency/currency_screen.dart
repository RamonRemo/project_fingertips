import 'package:flutter/material.dart';
import 'package:projeto_moedas/screens/currency/currency_controller.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final _controller = CurrencyController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
      //  future: _controller.outCall,
        builder: (context, data){
          return Container();
      }),
    );
  }
}