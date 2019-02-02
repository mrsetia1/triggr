import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/reason.dart';

abstract class TriggerAction {
  String toString() {
    return '$runtimeType';
  }
}

class AddTriggerAction extends TriggerAction {
  String text;

  AddTriggerAction(this.text);
}

class DeleteTriggerAction extends TriggerAction {
  String triggerId;

  DeleteTriggerAction(this.triggerId);
}

class UpdateTriggerStateAction extends TriggerAction {
  String triggerId;
  bool completed;

  UpdateTriggerStateAction(this.triggerId, this.completed);
}

class AddTriggerReasonAction extends TriggerAction {
  String triggerId;
  Reason reason;

  AddTriggerReasonAction(this.triggerId, this.reason);
}