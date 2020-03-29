import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
          ];
        },
        body: new Column(
          children: <Widget>[
            new FlutterLogo(size: 100.0, colors: Colors.purple),
            new Container(
              height: 300.0,
              child: new ListView.builder(
                itemCount: 60,
                itemBuilder: (BuildContext context, int index) {
                  return new Text('Item $index');
                },
              ),
            ),
            new FlutterLogo(size: 100.0, colors: Colors.orange),
          ],
        ),
      ),
    );
  }
}