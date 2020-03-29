import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_moedas/network/api_provider.dart';

class CryptoCurrency extends StatefulWidget {
  @override
  _CryptoCurrency createState() => _CryptoCurrency();
}

class _CryptoCurrency extends State<CryptoCurrency> {
  var data;
  String endpoint = "/crypto-currencies";

  @override
  void initState() {
    data = ApiProvider.getData(endpoint).then((map) {
      print(map);
    });
  }

  final mask = new NumberFormat("#,##0.00", "en_US");
  final borderRadius = 25.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: FutureBuilder(
          future: ApiProvider.getData(endpoint),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 5.0,
                  ),
                );
              default:
                if (snapshot.hasError)
                  return Center(
                    child: Text(
                      "Erro: é culpa da API, eu juro",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  );
                else
                  return _createScreen(context, snapshot);
            }
          }),
    );
  }

  Widget _createScreen(BuildContext context, AsyncSnapshot snapshot) {
    return RefreshIndicator(
        // color: Colors.white,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return Container(
              // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              height: double.maxFinite,
              color: Colors.white,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      cryptoNameSymbol(snapshot.data[index]),
                                      Spacer(),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Spacer(),
                                      SizedBox(height: 10),
                                      cryptoAmount(snapshot.data[index])
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            );
          },
        ),
        onRefresh: () {});
  }

  Widget cryptoNameSymbol(data) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: '${data['indexName']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n Atualizado: ${data['lastUpdate'].substring(8)}/${data['lastUpdate'].substring(5, 7)}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget cryptoAmount(data) {
    return Align(
        alignment: Alignment.center,
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                '\nR\$${mask.format(data['pastValue'])}',
                style: TextStyle(
                  // color: getColor(data['value']),
                  fontSize: 28,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '\n${data['variation']}%',
                    style: TextStyle(
                        fontSize: 18,
                        color:
                            data['variation'] < 0 ? Colors.red : Colors.green),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: data['variation'] < 0
                          ? Icon(
                              Icons.arrow_drop_down,
                              color: Colors.red,
                              size: 30,
                            )
                          : Icon(
                              Icons.arrow_drop_up,
                              color: Colors.green,
                              size: 30,
                            )),
                ],
              )
            ],
          ),
        ));
  }
  

  // Color getColor(String value) {
  //   if (value.contains("+") || value.contains("-")) {
  //     return value.contains("+") ? Colors.green : Colors.red;
  //   }
  //   return Colors.black;
  // }
}
