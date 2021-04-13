import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/models/app_state/app_description_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ViewModelのProvider
final descriptionViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  final model = ref.read(appModelProvider);
  final appState = ref.watch(model.appDescriptionStateProvider).state;

  return _DescriptionViewModel(ref, appState);
});

/// ViewModel
class _DescriptionViewModel extends ViewModel {
  _DescriptionViewModel(this.ref, this.appDescriptionState);

  @override
  final ProviderReference ref;
  final AppDescriptionState appDescriptionState;

  void onTap(TextEditingController controller) async {
    final title = controller.text;
    await ref.read(appModelProvider).updateDescription(title);
    Navigator.of(buildContext).pop();
  }
}
