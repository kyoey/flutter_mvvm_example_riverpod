import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/models/app_state/app_description_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final descriptionViewModelProvider =
    StateNotifierProvider.autoDispose<_DescriptionViewModel, Null>((ref) {
  final app = ref.watch(appDescriptionState).state;

  return _DescriptionViewModel(ref, app);
});

class _DescriptionViewModel extends ViewModel<Null> {
  _DescriptionViewModel(this.ref, this.appDescriptionState) : super(null);

  @override
  final ProviderReference ref;
  final AppDescriptionState appDescriptionState;

  void onTap(TextEditingController controller) async {
    final title = controller.text;
    await ref.read(appModel).updateDescription(title);
    Navigator.of(buildContext).pop();
  }
}
