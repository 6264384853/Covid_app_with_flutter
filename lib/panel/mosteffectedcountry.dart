import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 60),
                        child: Text(
                          countryData[index]['country'],
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 150,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Text(
                          "Deaths : " + countryData[index]['deaths'].toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Image(
                          image: NetworkImage(countryData[index]['countryInfo']
                                  ['flag']
                              .toString())),
                    )
                  ],
                ),
              );
            },
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}
