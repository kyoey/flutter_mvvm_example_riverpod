import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/app.dart';
import 'package:flutter_mvvm_example/models/debug/debug_data.dart';
import 'package:riverpod/riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

/// Stateのprovider
final debugStateProvider =
    StateProvider((ref) => ref.watch(debugModelProvider));

/// ModelのProvider
final debugModelProvider = StateNotifierProvider<DebugModel, DebugData>(
  (ref) {
    return DebugModel(ref);
  },
);

/// Model
class DebugModel extends StateNotifier<DebugData> with LocatorMixin {
  DebugModel(this.ref) : super(DebugData());

  final ProviderReference ref;

  BuildContext get buildContext =>
      ref.read(navigatorKeyProvider).currentState!.overlay!.context;

  void setDebugType(DebugType type) {
    state = state.copyWith(debugType: type);

    Navigator.of(buildContext).pop();
  }
}
