import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:triggr/models/trigger.dart';
import 'package:triggr/models/triggerState.dart';
import 'package:triggr/components/triggerList.dart';
import 'package:triggr/actions/triggers.dart';
import 'package:redux/redux.dart';

class _ViewModel {
  final List<Trigger> triggers;
  final Function loadLocal;

  _ViewModel({this.triggers, this.loadLocal});

  factory _ViewModel.from(Store<TriggerState> store) {
    final triggers = store.state.triggers;
    return _ViewModel(
        triggers: triggers,
        loadLocal: () => store.dispatch(getTriggersFromLocalStore));
  }
}

class TriggerListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TriggerState, _ViewModel>(
      onInitialBuild: (_ViewModel viewModel) {
        viewModel.loadLocal();
      },
      converter: (Store<TriggerState> store) {
        return new _ViewModel.from(store);
      },
      builder: (context, viewModel) =>
          new TriggerList(triggers: viewModel.triggers),
    );
  }
}
