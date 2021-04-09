import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mvvm_example/view_model/input_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Input extends StatelessWidget {
  const Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイトル変更'),
      ),
      body: const _Contents(),
    );
  }
}

/// HookWidget useProviderで参照
class _Contents extends HookWidget {
  const _Contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = useProvider(
        inputViewModelProvider.select((value) => value.appState.title));
    final titleController = TextEditingController(text: title);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: titleController,
        ),
        MaterialButton(
          color: Colors.greenAccent,
          splashColor: Colors.greenAccent.shade400,
          onPressed: () => context
              .read(inputViewModelProvider.notifier)
              .onTap(titleController),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }
}
