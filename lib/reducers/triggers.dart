import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/reason.dart';
import 'package:triggr/models/triggerState.dart';
import 'package:triggr/actions/triggers.dart';

List<Trigger> triggerReducer(List<Trigger> state, dynamic action) {
  if (action is AddTriggerAction) {
      return addTrigger(state, action);
  }
  return state;
}

List<Trigger> addTrigger(List<Trigger> triggers, AddTriggerAction action) {
  return List.from(triggers)
    ..add(new Trigger(action.text, action.text, new List<Reason>()));
}

TriggerState triggerAppReducer(TriggerState state, dynamic action) {
  return new TriggerState(triggers: triggerReducer(state.triggers, action));
}
