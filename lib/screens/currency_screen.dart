import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_moedas/network/api_provider.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  var data;
  String endpoint = "/currencies";

  ApiProvider _api;
  _CurrencyScreenState() {
    _api = ApiProvider();
  }

  @override
  void initState() {
    ApiProvider.getData(endpoint).then((map) {
      data = map;
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
                return _buildInLoading();
              default:
                if (snapshot.hasError) return _buildEmptyState();

                if (snapshot.data.length == 0) {
                  return Center(
                    child: Text(
                      "Tá Vaziao",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  );
                } else
                  return createScreen(context, snapshot);
            }
          }),
    );
  }

  Center _buildEmptyState() {
    return Center(
      child: Text(
        "Erro: é culpa da API, eu juro",
        style: TextStyle(fontSize: 30, color: Colors.red),
      ),
    );
  }

  Container _buildInLoading() {
    return Container(
      width: 200.0,
      height: 200.0,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 5.0,
      ),
    );
  }

  Widget createScreen(BuildContext context, AsyncSnapshot snapshot) {
    return RefreshIndicator(
        // color: Colors.white,
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
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
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
          children: <TextSpan>[
            TextSpan(
                text:
                    '\n Atualizado: ${data['lastUpdate'].substring(8)}/${data['lastUpdate'].substring(5, 7)}',
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
                '\nR\$${mask.format(data['buy'])}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '\n${data['variation']}%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            data['variation'] < 0 ? Colors.red : Colors.green,
                      ),
                    ),
                  ),
                  Align(
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
                          ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
