import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/view/pages/description.dart';
import 'package:flutter_mvvm_example/view/pages/input.dart';
import 'package:flutter_mvvm_example/view/widgets/change_title_dialog.dart';
import 'package:flutter_mvvm_example/view_model/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/home_view_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _HomeTitle(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Input();
                  },
                ),
              ),
            },
          ),
          IconButton(
            icon: Icon(Icons.description),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Description();
                  },
                ),
              ),
            },
          ),
        ],
      ),
      body: const _Memos(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showChangeTitleDialog(context),
        child: Icon(Icons.title),
      ),
    );
  }
}

class _HomeTitle extends ConsumerWidget {
  const _HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final title = watch(homeViewModelProvider.notifier).title;
    return Text(title);
  }
}

class _Memos extends ConsumerWidget {
  const _Memos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final memos = watch(homeViewModelProvider.notifier).memos;
    return ListView(
      children: [
        for (final memo in memos)
          ListTile(
            title: Text(memo.title),
            subtitle: Text(memo.contents),
          ),
        MaterialButton(
          color: Colors.greenAccent,
          splashColor: Colors.greenAccent.shade400,
          onPressed: () =>
              context.read(homeViewModelProvider.notifier).onTapAddMemo(),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }
}
