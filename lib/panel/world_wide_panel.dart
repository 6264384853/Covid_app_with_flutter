import 'package:covid/panel/status_panel.dart';
import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {

  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            panelColor: Colors.pinkAccent,
            title: "CONFIRMED",
            textColor: Colors.white,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.lightBlue,
            title: "ACTIVE",
            textColor: Colors.white,
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.greenAccent,
            title: "RECOVERED",
            textColor: Colors.black,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.grey,
            title: "DEATH",
            textColor: Colors.white,
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}
