import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final inputViewModelProvider =
    StateNotifierProvider.autoDispose<_InputViewModel, Null>((ref) {
  final app = ref.watch(appState).state;

  return _InputViewModel(ref, app);
});

class _InputViewModel extends ViewModel<Null> {
  _InputViewModel(this.ref, this.appState) : super(null);

  @override
  final ProviderReference ref;
  final AppState appState;

  void onTap(TextEditingController controller) async {
    final title = controller.text;
    await ref.read(appModel).updateTitle(title);
    Navigator.of(buildContext).pop();
  }
}
