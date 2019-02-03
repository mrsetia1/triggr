import 'package:triggr/models/trigger.dart';

class TriggerState {
  final List<Trigger> triggers;
  final Trigger activeTrigger;

  const TriggerState({
    this.triggers,
    this.activeTrigger
  });

  // allows to modify AuthState parameters while cloning previous ones
  TriggerState copyWith({
    List<Trigger> triggers,
    Trigger activeTrigger
  }) {
    return new TriggerState(
      triggers: triggers ?? <Trigger>[],
      activeTrigger: activeTrigger ?? null
    );
  }

  TriggerState.initialState()
      : triggers = <Trigger>[], activeTrigger = null;
}