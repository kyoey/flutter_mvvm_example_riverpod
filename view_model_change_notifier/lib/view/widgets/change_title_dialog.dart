import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mvvm_example/app.dart';
import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _formKey = GlobalKey<FormState>();

/// ControllerのProvider

final _dialogControllerProvider = ChangeNotifierProvider.autoDispose((ref) {
  return _ChangeTitleDialogController(
    ref.read,
  );
});

/// Controller

class _ChangeTitleDialogController extends ViewModel {
  _ChangeTitleDialogController(
    this.read,
  );

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;
  @override
  final Reader read;

  /// Model
  AppModel get appModel => read(appModelProvider.notifier);

  /// State
  AppState get appState => read(appModelProvider);

  void onCompleteEditing(TextEditingController controller) async {
    final isValidTitle = _formKey.currentState?.validate() ?? false;
    if (!isValidTitle) return;

    _isProcessing = true;
    notifyListeners();

    final title = controller.text;
    await appModel.updateTitle(title);

    Navigator.of(buildContext).pop();
  }

  String? validationInput(String? value) {
    if (value == null) return 'Input some text.';
    if (value.length < 4) return 'Title text length requires at least 4.';

    return null;
  }
}

/// UI

class _TitleForm extends HookWidget {
  const _TitleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = useProvider(
        _dialogControllerProvider.select((model) => model.appState.title));
    final controller = TextEditingController(text: title);
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: controller,
        validator:
            context.read(_dialogControllerProvider.notifier).validationInput,
        autovalidateMode: AutovalidateMode.always,
        textInputAction: TextInputAction.done,
        onEditingComplete: () => context
            .read(_dialogControllerProvider.notifier)
            .onCompleteEditing(controller),
      ),
    );
  }
}

class _LoadingOverlay extends HookWidget {
  const _LoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isProcessing = useProvider(
        _dialogControllerProvider.select((value) => value.isProcessing));
    return isProcessing
        ? DecoratedBox(
            decoration: BoxDecoration(color: Colors.black12),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SizedBox.shrink();
  }
}

void showChangeTitleDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _ChangeTitleDialog(),
    );

class _ChangeTitleDialog extends StatelessWidget {
  const _ChangeTitleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleDialog(
          contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          title: Text('Title change to:'),
          children: [
            const _TitleForm(),
          ],
        ),
        Positioned.fill(child: const _LoadingOverlay()),
      ],
    );
  }
}
