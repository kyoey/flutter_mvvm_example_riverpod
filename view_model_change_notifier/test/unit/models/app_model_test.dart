import 'package:flutter_mvvm_example/models/controllers/memo_model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('MemoModel state management tests', () {
    test('MemoModel should be initialize successfully', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final expectedState = MemoState();
      expect(container.read(memoModelProvider), expectedState);
    });

    test('MemoModel should add memo successfully', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      /// Model
      final model = container.read(memoModelProvider);

      container.read(memoModelProvider.notifier).addMemo('テストタイトル', 'テストコンテンツ');

      final expectedMemo =
          Memo.uuid().copyWith(title: 'テストタイトル', contents: 'テストコンテンツ');
      final expectedState = MemoState(memos: [expectedMemo]);
      expect(container.read(memoModelProvider), expectedState);
    });

    test('MemoModel should update loading successfully', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(memoModelProvider.notifier).toggleUpdate();

      expect(container.read(memoModelProvider).isLoading, true);

      container.read(memoModelProvider.notifier).toggleUpdate();

      expect(container.read(memoModelProvider).isLoading, false);
    });
  });
}
