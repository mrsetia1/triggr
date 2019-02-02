import 'package:triggr/models/trigger.dart';

import 'package:flutter/foundation.dart';

class TriggerState {
  final List<Trigger> triggers;
  final Trigger activeTrigger;

  const TriggerState({
    @required this.triggers,
    this.activeTrigger
  });

  TriggerState.initialState()
      : triggers = <Trigger>[], activeTrigger = null;
}