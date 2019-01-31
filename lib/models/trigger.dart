import 'package:triggr/models/reason.dart';

class Trigger {
  final String title;
  final String content;
  final List<Reason> reasons;

  Trigger(this.title, this.content, this.reasons);
}
