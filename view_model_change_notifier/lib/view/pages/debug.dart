import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mvvm_example/models/debug/debug_data.dart';
import 'package:flutter_mvvm_example/models/debug/debug_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Debug extends StatelessWidget {
  const Debug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('環境切り替え'),
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
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: <Widget>[
        for (final type in DebugType.values) ...[
          _Item(
            title: type.toString(),
            tapCallback: () =>
                context.read(debugModelProvider.notifier).setDebugType(type),
          ),
          Divider(
            color: Colors.black54,
          ),
        ],
      ],
    );
  }
}

class _Item extends HookWidget {
  const _Item({
    required this.title,
    required this.tapCallback,
  });

  final String title;
  final GestureTapCallback tapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          title,
        ),
      ),
    );
  }
}
