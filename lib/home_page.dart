import 'package:flutter/material.dart';

import 'CustomDrawer.dart';
import 'CustomGrid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Rafael o Cinzento!"),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: CustomGrid(),
          drawer: CustomDrawer(),
          backgroundColor: Colors.grey,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("E Esse amor é Azul!"),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          drawer: CustomDrawer(),
          backgroundColor: Colors.blueAccent,
        )
      ],
    );
  }
}
