import 'package:uuid/uuid.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:flutter_mmkv/flutter_mmkv.dart';
import 'dart:convert';

import 'package:triggr/models/triggerState.dart';
import 'package:triggr/models/trigger.dart';

ThunkAction<TriggerState> addTriggerAndStoreAction =
(Store<TriggerState> store) async {
//  store.dispatch(AddTriggerAction(text));
};

ThunkAction<TriggerState> saveTriggersInLocalStore =
(Store<TriggerState> store) async {

  List<Trigger> stateTriggers = store.state.triggers;

  var encodedList = jsonEncode(stateTriggers.map((t) => t.toJson()).toList());

  await FlutterMmkv.encodeString("mytriggers", encodedList);
};

ThunkAction<TriggerState> getTriggersFromLocalStore =
    (Store<TriggerState> store) async {
  String storedTriggersJSON;
  List<Trigger> storedTriggers = new List<Trigger>();

  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    storedTriggersJSON = await FlutterMmkv.decodeString("mytriggers");
  } on Exception {
    print('Failed to get local data.');
    return;
  }

  var storedTriggerList =
      jsonDecode(storedTriggersJSON).map((t) => Trigger.fromJson(t));

  storedTriggerList.forEach((t) => storedTriggers.add(t));

  store.dispatch(new SetTriggersAction(storedTriggers));
};

class SetTriggersAction {
  List<Trigger> triggers;

  SetTriggersAction(this.triggers);
}

class SetActiveTriggerAction {
  Uuid triggerId;

  SetActiveTriggerAction(this.triggerId);
}

class AddTriggerAction {
  String text;

  AddTriggerAction(this.text);
}

class DeleteTriggerAction {
  String triggerId;

  DeleteTriggerAction(this.triggerId);
}

class UpdateTriggerStateAction {
  String triggerId;
  bool completed;

  UpdateTriggerStateAction(this.triggerId, this.completed);
}

class AddTriggerReasonAction {
  String triggerId;
  String reasonText;

  AddTriggerReasonAction(this.triggerId, this.reasonText);
}
