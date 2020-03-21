import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:intl/intl.dart';
import 'crypto_data.dart';

class MoneyCard3 extends StatelessWidget {
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  var cryptoData = CryptoData.getData;
  final String _name = "Bitcoin";
  final double _buy = 29695.656;
  // final double _sell = 29695.656;
  final double _variation = -25.455;
  final String _lastUpdate = "2020-03-12";

  final borderRadius = 25.0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        // color: Colors.white,
        child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: cryptoData.length,
          itemBuilder: (context, index) {
            return Container(
              // padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                    padding: EdgeInsets.all(0),
                    child: Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      cryptoNameSymbol(cryptoData[index]),
                                      Spacer(),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      cryptoAmount(cryptoData[index])
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
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['type']}',
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
          child: Row(
            children: <Widget>[
              Text(
                '\nR\$${oCcy.format(data['buy'])}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  
                ),
              )
            ],
          ),
        ));
  }
}

//   Widget cryptoAmount(data) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20.0),
//         child: Row(
//           children: <Widget>[
//             RichText(
//               textAlign: TextAlign.left,
//               text: TextSpan(
//                 text: '\n\$${data['buy']}',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 35,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: '\n${data['variation']}%',
//                       style: TextStyle(
//                           color:
//                               data['variation'] < 0 ? Colors.red : Colors.green,
//                           fontStyle: FontStyle.italic,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
