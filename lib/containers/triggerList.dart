import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/triggerState.dart';
import 'package:triggr/components/triggerList.dart';

class _ViewModel {
  final List<Trigger> triggers;
  _ViewModel({this.triggers});
}

class TriggerListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TriggerState, _ViewModel>(
      converter: (store) => new _ViewModel(
          triggers: store.state.triggers),
      builder: (context, viewModel) =>
          new TriggerList(triggers: viewModel.triggers),
    );
  }
}
