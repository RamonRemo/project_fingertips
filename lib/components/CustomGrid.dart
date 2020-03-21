import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class CustomGrid extends StatefulWidget {
  @override
  _CustomGridState createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {

  //   _getCurrencies() async {
  //   http.Response response = await http.get("http://10.0.2.2:5000/currencies");
  //   return json.decode(response.body);
  // }

  // @override
  // void initState() {
  //   _getCurrencies().then((map) {
  //     print(map);
  //   });
  // }

    @override
    Widget build(BuildContext context) {
      return GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return Center(
            child: Text('Faeles $index',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          );
        }),
      );
    }

    Widget createCurrenciesTable(BuildContext context, AsyncSnapshot snapshot) {
      return PageView(
        children: <Widget>[
          Container(),
        ],
      );
    }
  }


