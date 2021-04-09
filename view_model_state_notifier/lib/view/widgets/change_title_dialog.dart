import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _ViewState {
  final bool isProcessing;

  const _ViewState(this.isProcessing);
}

final _dialogControllerProvider =
    StateNotifierProvider.autoDispose<_ChangeTitleDialogController, _ViewState>(
        (ref) {
  return _ChangeTitleDialogController(ref);
});

void showChangeTitleDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _ChangeTitleDialog(),
    );

final _textEditingController = Provider.autoDispose((ref) {
  final title = ref.read(appState).state.title;
  return TextEditingController(text: title);
});

final _formKey = GlobalKey<FormState>();

class _ChangeTitleDialogController extends ViewModel<_ViewState> {
  @override
  final ProviderReference ref;

  _ChangeTitleDialogController(this.ref) : super(_ViewState(false));

  void onCompleteEditing() async {
    final isValidTitle = _formKey.currentState?.validate() ?? false;
    if (!isValidTitle) return;

    state = _ViewState(!state.isProcessing);

    final title = ref.read(_textEditingController).text;
    await ref.read(appModel).updateTitle(title);

    Navigator.of(buildContext).pop();
  }

  String? validationInput(String? value) {
    if (value == null) return 'Input some text.';
    if (value.length < 4) return 'Title text length requires at least 4.';

    return null;
  }
}

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

class _TitleForm extends ConsumerWidget {
  const _TitleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final controller = watch(_textEditingController);
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
            .onCompleteEditing(),
      ),
    );
  }
}

class _LoadingOverlay extends ConsumerWidget {
  const _LoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // TODO: selectできるようにする
    final isProcessing = watch(_dialogControllerProvider).isProcessing;
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
