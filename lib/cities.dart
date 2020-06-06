import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cities extends StatefulWidget {
  @override
  _CitiesState createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
// Fetch Reginal data

  Map regionalData;
  List city = List(), data = List();
  bool showList = false;

  fetchregionalData() async {
    http.Response response =
    await http.get('https://api.covidindiatracker.com/state_data.json');
    data = json.decode(response.body) as List;
    print(data);
    // data=regionalData as List;
    for (int i = 0; i < data.length; i++) {
      if (data[i]['state'] == 'Madhya Pradesh') {
        city = data[i]['districtData'] as List;
        break;
      }
    }
    print('Data==${city.length}===$city');
    setState(() {
      showList = true;
    });
  }

  @override
  void initState() {
    fetchregionalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("country App bar"),
      ),
      body: showList
          ? ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 130,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(city[index]['name']),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'CONFIRMED : ' +
                                  city[index]['confirmed'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                            Text(
                              'RECOVERED : ' +
                                  city[index]['recovered'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              'DEATH : ' + city[index]['deaths'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent),
                            ),
                            Text(
                              'ACTIVE : ' +
                                  city[index]['active'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          },
          itemCount: city.length)
          : Center(child: CircularProgressIndicator()),
    );
  }
}
