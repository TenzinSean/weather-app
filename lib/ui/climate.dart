import 'package:flutter/material.dart';
import '../util/utils.dart';

class Climate extends StatefulWidget {
  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
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
            onPressed: () => debugPrint("Hey")
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
            alignment: Alignment.center,
            child: new Text('123F', style: tempStyle()),
          )

        ],
      )
    );
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