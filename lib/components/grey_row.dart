import 'package:flutter/material.dart';

class GreyRow extends StatefulWidget {
  String name;
  GreyRow(this.name);

  @override
  _GreyRowState createState() => _GreyRowState(name);
}

class _GreyRowState extends State<GreyRow> {
  final String name;
  _GreyRowState(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$name",
            style: TextStyle(fontSize: 20, color: Colors.white70),
            textAlign: TextAlign.center,
          )
        ],
      ),
      color: Colors.grey,
    );
  }
}
