import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/view_model/description_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アプリ説明文の変更'),
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
    final description =
        useProvider(appModelProvider.select((value) => value.description));

    final titleController = TextEditingController(text: description);
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
              .read(descriptionViewModelProvider.notifier)
              .onTap(titleController),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }
}
