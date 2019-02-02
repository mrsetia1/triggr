import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/reason.dart';

import 'package:flutter/foundation.dart';

class TriggerState {
  final List<Trigger> triggers;

  const TriggerState({
    @required this.triggers
  });

  TriggerState.initialState()
      : triggers = <Trigger>[
        new Trigger("test", "test", new List<Reason>())
  ];
}