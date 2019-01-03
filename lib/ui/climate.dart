import 'package:flutter/material.dart';
import '../util/utils.dart' as util;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Climate extends StatefulWidget {
  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {

  void showStuff() async {
   Map data =  await getWeather(util.apiId, util.defaultCity);
   print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Climate'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: showStuff
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/po1.jpeg',
            width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,)
          ),

          new Container(
            alignment: Alignment.topRight,
              margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: new Text(' བོད',
            style: cityStyle(),),
          ),

          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/weather.png'),
          ),

          new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 300.0, 0.0, 20.0),
            child: updateTempWidget("San+Francisco"),
          )

        ],
      )
    );
  }

  Future<Map> getWeather(String apiId, String city) async
  {
    String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=''${util.apiId}&units=imperial';
    http.Response response =  await http.get(apiUrl);
    return json.decode(response.body);
  }


  Widget updateTempWidget(String city) {
    return new FutureBuilder(
      future: getWeather(util.apiId, city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          // where we get all of the info or jsom data, we setup widget etc
          if (snapshot.hasData) {
            Map content = snapshot.data;
              return new Container(
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text(content['main']['temp'].toString(),
                      style: new TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      )),
                    )
                  ],
                )
              );
          } else {
            return new Container();
          }

        });
  }

 }


TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}


TextStyle tempStyle() {
  return TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}