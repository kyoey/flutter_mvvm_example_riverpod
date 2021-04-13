import 'package:flutter_mvvm_example/models/app_state/app_description_state.dart';
import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stateのprovider
final _appStateProvider = StateProvider((_) => AppState());
final _appDescriptionStateProvider =
    StateProvider((_) => AppDescriptionState());

/// ModelのProvider
final appModelProvider = Provider.autoDispose(
  (ref) => _AppModel(
    ref,
  ),
);

/// Model
class _AppModel extends Model {
  _AppModel(
    this.ref,
  );

  @override
  final ProviderReference ref;

  StateProvider<AppState> get appStateProvider => _appStateProvider;
  StateProvider<AppDescriptionState> get appDescriptionStateProvider =>
      _appDescriptionStateProvider;

  Future updateTitle(String title) async {
    await Future.delayed(const Duration(seconds: 1));
    ref.read(_appStateProvider).state =
        ref.read(_appStateProvider).state.copyWith(title: title);
  }

  Future updateDescription(String description) async {
    await Future.delayed(const Duration(seconds: 2));

    ref.read(_appDescriptionStateProvider).state = ref
        .read(_appDescriptionStateProvider)
        .state
        .copyWith(description: description);
  }
}
