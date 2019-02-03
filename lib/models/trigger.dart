import 'package:triggr/models/reason.dart';
import 'package:uuid/uuid.dart';

class Trigger {
  String id;
  String title;
  List<Reason> reasons = new List<Reason>();

  String getProgress () {
    return (this.reasons.length / 2).toString();
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'title': title,
      };

  Trigger(this.id, this.title);

  factory Trigger.fromJson(Map<String, dynamic> json) {
    return Trigger(json['id'], json['title']);
  }
}
