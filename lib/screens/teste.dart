import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_moedas/network/api_provider.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  var data;
  String endpoint = "/currencies";

  ApiProvider _api;
  _Teste() {
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
      padding: EdgeInsets.only(top: 7),
      child: FutureBuilder(
          future: ApiProvider.getData(endpoint),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return _buildInLoading();
              default:
                if (snapshot.hasError) return _buildHasError();
                if (snapshot.data.length == 0)
                  return _buildIsEmpty();
                else
                  return createScreen(context, snapshot);
            }
          }),
    );
  }

  Center _buildIsEmpty() {
    {
      return Center(
        child: Text(
          "Tá Vaziao",
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      );
    }
  }

  Center _buildHasError() {
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
    return Container(
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
            color: Colors.white,
            child: Card(
              elevation: 5,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 8),
                  _createUpperHalf(snapshot.data[index]),
                  SizedBox(height: 40),
                  _createBottomHalf(snapshot.data[index])
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _createUpperHalf(data) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: <Widget>[
            Text(
              "Bitcoin",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            Text(
              "subdata",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget _createBottomHalf(data) {
    return Align(
        child: Column(
      children: <Widget>[
        Text(
          'R\$XXX.XXX,00',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '\n${data['variation']}%',
              style: TextStyle(
                fontSize: 20,
                color: data['variation'] < 0 ? Colors.red : Colors.green,
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
        ),
      ],
    ));
  }
}
