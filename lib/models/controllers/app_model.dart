import 'package:flutter_mvvm_example/models/app_state/app_description_state.dart';
import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appState = StateProvider((_) => AppState());
final appDescriptionState = StateProvider((_) => AppDescriptionState());

final appModel = Provider.autoDispose((ref) {
  final title = ref.watch(appState).state;
  final description = ref.watch(appDescriptionState).state;
  return AppModel(ref, title, description);
});

class AppModel extends Model {
  AppModel(this.ref, this.appStateData, this.appDescriptionStateData);

  @override
  final ProviderReference ref;

  final AppState appStateData;
  final AppDescriptionState appDescriptionStateData;

  Future updateTitle(String title) async {
    await Future.delayed(const Duration(seconds: 1));

    ref.read(appState).state = appStateData.copyWith(title: title);
  }

  Future updateDescription(String description) async {
    await Future.delayed(const Duration(seconds: 2));

    ref.read(appDescriptionState).state =
        appDescriptionStateData.copyWith(description: description);
  }
}
