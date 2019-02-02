import 'package:uuid/uuid.dart';
import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/reason.dart';
import 'package:triggr/models/triggerState.dart';
import 'package:triggr/actions/triggers.dart';

List<Trigger> triggerReducer(List<Trigger> state, dynamic action) {
  if (action is AddTriggerAction) {
      return addTrigger(state, action);
  } else if (action is AddTriggerReasonAction) {
    return addReason(state, action);
  }
  return state;
}

List<Trigger> addTrigger(List<Trigger> triggers, AddTriggerAction action) {
  return List.from(triggers)
    ..add(new Trigger(new Uuid(), action.text, action.text, new List<Reason>()));
}

List<Trigger> addReason(List<Trigger> triggers, AddTriggerReasonAction action) {
  final trigger = triggers.firstWhere((trigger) => trigger.id == action.triggerId);
  trigger.reasons.add(new Reason(action.reasonText, false));
  return List.from(triggers);
}

TriggerState triggerAppReducer(TriggerState state, dynamic action) {
  return new TriggerState(triggers: triggerReducer(state.triggers, action));
}
