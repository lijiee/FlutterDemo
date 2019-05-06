import 'package:flutter/material.dart';
class ExamFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text("Osechie line",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
              new Text(
                "kand ,swoterzer",
                style: new TextStyle(
                    color: Colors.grey[500]
                ),
              ),
            ],
          ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text("41"),
        ],
      ),
    );

    Column buildButtonColum(IconData icon,String label){
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon,color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
                label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),

            ),
          )
        ],
      );

    }
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColum(Icons.call, "Call"),
          buildButtonColum(Icons.near_me, "Route"),
          buildButtonColum(Icons.share, "Share"),
        ],
      ),
    );
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text("' dfsdfsdfsd"
          "dfsdfsdfsdfsd"
          "sdfsdfsdfsdf"
          "sdfsdfsdf'",
      softWrap: true,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("dsdf"),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(
            'images/down.gif',
            height: 240,
            fit: BoxFit.fitHeight,
           ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),

    );
  }
}