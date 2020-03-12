import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
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
}
