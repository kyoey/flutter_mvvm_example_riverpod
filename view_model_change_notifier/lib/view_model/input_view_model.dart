import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ViewModelのProvider
final inputViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  final model = ref.read(appModelProvider);
  final appState = ref.watch(model.appStateProvider).state;
  return _InputViewModel(ref, appState);
});

class _InputViewModel extends ViewModel {
  _InputViewModel(this.ref, this.appState);

  @override
  final ProviderReference ref;
  final AppState appState;

  void onTap(TextEditingController controller) async {
    final title = controller.text;
    await ref.read(appModelProvider).updateTitle(title);
    Navigator.of(buildContext).pop();
  }
}
