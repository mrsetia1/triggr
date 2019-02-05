import 'package:triggr/models/reason.dart';

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
        'reasons': reasons.map((r) => r.toJson()).toList()
      };

  Trigger(this.id, this.title, this.reasons);

  factory Trigger.fromJson(Map<String, dynamic> json) {
    var list = json['reasons'] as List;
    List<Reason> reasons = new List<Reason>();
    if (list != null) {
      reasons = list.map((r) => Reason.fromJson(r)).toList();
    }
    return Trigger(json['id'], json['title'], reasons);
  }
}
