import 'package:flutter/material.dart';

import 'package:triggr/models/trigger.dart';
import 'package:triggr/pages/detail.dart';

@immutable
class TriggerList extends StatelessWidget {
  const TriggerList({Key key, this.triggers})
      : super(key: key);

  final List<Trigger> triggers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 60,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20, left: 20, bottom: 80),
        itemExtent: 80.0,
        // Let the ListView know how many items it needs to build
        itemCount: triggers.length,
        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final trigger = triggers[index];
          return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(trigger: trigger)));
              },
              title: Text(trigger.title),
              subtitle: Text(trigger.hasReasons() ? trigger.reasons[0].toString() : 'none'));
        },
      ),
    );
  }
}
