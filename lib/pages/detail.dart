import 'package:flutter/material.dart';

import 'package:triggr/models/trigger.dart';

class DetailPage extends StatelessWidget {
  final Trigger trigger;

  DetailPage({Key key, this.trigger}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Text(
          trigger.title,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 40.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white, size: 40,),
          ),
        )
      ],
    );

    return new Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[topContent],
        ),
      ),
    );
  }
}
