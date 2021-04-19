import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/app.dart';
import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ViewModelのProvider
final inputViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return InputViewModel(ref.read);
});

class InputViewModel extends ViewModel {
  InputViewModel(
    this.read,
  );

  @override
  final Reader read;

  /// Model
  AppModel get appModel => read(appModelProvider.notifier);

  void onTap(TextEditingController controller) async {
    final title = controller.text;
    await appModel.updateTitle(title);
    Navigator.of(buildContext).pop();
  }
}
