import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(12.0),
      height: 80,
      width: width / 2,
      decoration: BoxDecoration(
        color: this.panelColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: this.textColor,
                letterSpacing: 1.2),
          ),
          SizedBox(
            height: 5,
          ),
          Text(this.count,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: this.textColor,
                  letterSpacing: 1.0)),
        ],
      ),
    );
  }
}
