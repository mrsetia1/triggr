import 'package:flutter/material.dart';

import 'package:triggr/models/trigger.dart';

@immutable
class TriggerList extends StatelessWidget {
  const TriggerList({Key key, this.triggers}) : super(key: key);

  final List<Trigger> triggers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 60,
      child: ListView.builder(
        // Let the ListView know how many items it needs to build
        itemCount: triggers.length,
        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = triggers[index];
          return ListTile(
              title: Text(item.title), subtitle: Text(item.content));
        },
      ),
    );
  }
}