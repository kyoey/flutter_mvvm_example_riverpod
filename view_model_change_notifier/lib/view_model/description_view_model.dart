import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ViewModelのProvider
final descriptionViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return DescriptionViewModel(ref.read);
});

/// ViewModel
class DescriptionViewModel extends ViewModel {
  DescriptionViewModel(this.read);

  @override
  final Reader read;

  /// Model
  AppModel get appModel => read(appModelProvider.notifier);

  void onTap(TextEditingController controller) async {
    final title = controller.text;
    await appModel.updateDescription(title);
    Navigator.of(buildContext).pop();
  }
}
