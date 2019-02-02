import 'package:uuid/uuid.dart';

abstract class TriggerAction {
  String toString() {
    return '$runtimeType';
  }
}

class SetActiveTriggerAction extends TriggerAction {
  Uuid triggerId;

  SetActiveTriggerAction(this.triggerId);
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
  Uuid triggerId;
  String reasonText;

  AddTriggerReasonAction(this.triggerId, this.reasonText);
}