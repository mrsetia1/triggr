import 'package:uuid/uuid.dart';
import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/reason.dart';
import 'package:triggr/models/triggerState.dart';
import 'package:triggr/actions/triggers.dart';

TriggerState triggerReducer(TriggerState state, dynamic action) {
  if (action is AddTriggerAction) {
    return addTrigger(state, action);
  } else if (action is AddTriggerReasonAction) {
    return addReason(state, action);
  } else if (action is SetTriggersAction) {
    return setTriggers(state, action);
  }
  return state;
}

TriggerState addTrigger(TriggerState state, AddTriggerAction action) {
  Trigger newTrigger =
      new Trigger(new Uuid().v1(), action.text, new List<Reason>());
  List<Trigger> triggers = List.from(state.triggers)..add(newTrigger);
  return state.copyWith(triggers: triggers, activeTrigger: newTrigger);
}

TriggerState addReason(TriggerState state, AddTriggerReasonAction action) {
  final trigger =
      state.triggers.firstWhere((trigger) => trigger.id == action.triggerId);
  trigger.reasons.add(new Reason(action.reasonText));
  return state;
}

TriggerState setTriggers(TriggerState state, SetTriggersAction action) {
  return state.copyWith(
    triggers: action.triggers
  );
}