import 'package:triggr/models/reason.dart';
import 'package:uuid/uuid.dart';

class Trigger {
  String id;
  String title;
  List<Reason> reasons = new List<Reason>();

  String getProgress () {
    return (this.reasons.length / 2).toString();
  }

  bool hasReasons () {
    return this.reasons.length > 0;
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'title': title,
//        'reasons': reasons
      };

  Trigger(this.id, this.title);

  factory Trigger.fromJson(Map<String, dynamic> json) {
//    List<Reason> reasons = new List<Reason>();
//    var foo = json['reasons'];
//    json['reasons'].forEach((r) => reasons.add(new Reason(r)));
    return Trigger(json['id'], json['title']);
  }
}
