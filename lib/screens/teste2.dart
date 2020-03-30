import 'package:flutter/material.dart';

class Teste2 extends StatelessWidget {
  final double borderRadius;
  final Color color;
  final int indicator;
  final String title;
  final String footer;
  final double height;
  final Color colorFont;
  final IconData iconData;

  const Teste2({
    Key key,
    this.borderRadius = 8.0,
    this.color = Colors.grey,
    this.colorFont = Colors.white,
    this.indicator = 0,
    this.title,
    this.footer,
    this.iconData = Icons.check_box_outline_blank,
    this.height = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: height,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: Column(
          children: <Widget>[
            _buildTitle(),
            _buildSource(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    indicator.toString(),
                    style: TextStyle(
                      color: colorFont,
                      fontSize: 28.0,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "$title",
                    style: TextStyle(
                      color: colorFont,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              iconData,
              size: 70,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildSource() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: new BoxDecoration(
        color: Colors.black12,
        borderRadius: new BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "$footer",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: colorFont,
                fontWeight: FontWeight.w600,
                fontSize: 8,
              ),
            ),
          ),
          Icon(
            Icons.info,
            size: 14.0,
            color: colorFont,
          ),
        ],
      ),
    );
  }
}