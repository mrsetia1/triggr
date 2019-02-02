import 'package:triggr/models/reason.dart';
import 'package:uuid/uuid.dart';

class Trigger {
  Uuid id;
  String title;
  String content;
  List<Reason> reasons;

  Trigger(this.id, this.title, this.content, this.reasons);
}
