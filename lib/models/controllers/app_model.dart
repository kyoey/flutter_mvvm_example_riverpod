import 'package:flutter_mvvm_example/models/app_state/app_description_state.dart';
import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appState = StateProvider((_) => AppState());
final appDescriptionState = StateProvider((_) => AppDescriptionState());

final appModel = Provider.autoDispose((ref) => AppModel(
      ref,
      appState,
      appDescriptionState,
    ));

class AppModel extends Model {
  AppModel(
    this.ref,
    this.appStateProvider,
    this.appDescriptionStateProvider,
  );

  @override
  final ProviderReference ref;

  final StateProvider<AppState> appStateProvider;
  final StateProvider<AppDescriptionState> appDescriptionStateProvider;

  Future updateTitle(String title) async {
    await Future.delayed(const Duration(seconds: 1));
    ref.read(appStateProvider).state =
        ref.read(appStateProvider).state.copyWith(title: title);
  }

  Future updateDescription(String description) async {
    await Future.delayed(const Duration(seconds: 2));

    ref.read(appDescriptionStateProvider).state = ref
        .read(appDescriptionStateProvider)
        .state
        .copyWith(description: description);
  }
}
