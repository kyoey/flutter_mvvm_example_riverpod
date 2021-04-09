import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/models/controllers/memo_model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

class Listener extends Mock {
  void call(MemoState value);
}

void main() {
  group('MemoModel state management tests', () {
    test('MemoModel should be initialize successfully', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final listener = Listener();

      container.listen<StateController<MemoState>>(
        memoStateProvider,
        didChange: (sub) => listener(sub.read().state),
      );

      final expectedState = MemoState();
      expect(container.read(memoStateProvider).state, expectedState);
    });

    test('MemoModel should add memo successfully', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final listener = Listener();

      container.listen<StateController<MemoState>>(
        memoStateProvider,
        didChange: (sub) => listener(sub.read().state),
      );

      container.read(memoModelProvider).addMemo('テストタイトル', 'テストコンテンツ');

      final expectedMemo =
          Memo.uuid().copyWith(title: 'テストタイトル', contents: 'テストコンテンツ');
      final expectedState = MemoState(memos: [expectedMemo]);
      expect(container.read(memoStateProvider).state, expectedState);
    });

    test('MemoModel should update loading successfully', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final listener = Listener();

      container.listen<StateController<MemoState>>(
        memoStateProvider,
        didChange: (sub) => listener(sub.read().state),
      );

      container.read(memoModelProvider).toggleUpdate();

      expect(container.read(memoStateProvider).state.isLoading, true);

      container.read(memoModelProvider).toggleUpdate();

      expect(container.read(memoStateProvider).state.isLoading, false);
    });
  });
}
