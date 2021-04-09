import 'package:flutter_mvvm_example/models/controllers/model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Modelで操作するStateのprovider
final memoStateProvider = StateProvider((_) => MemoState());

/// ModelのProvider
final memoModelProvider = Provider.autoDispose((ref) {
  return MemoModel(ref, memoStateProvider);
});

/// Model
class MemoModel extends Model {
  MemoModel(this.ref, this.memoStateProvider);
  @override
  final ProviderReference ref;
  final StateProvider<MemoState> memoStateProvider;

  void addMemo(String title, String contents) {
    final oldMemos = ref.read(memoStateProvider).state.memos;
    ref.read(memoStateProvider).state =
        ref.read(memoStateProvider).state.copyWith(memos: [
      ...oldMemos,
      Memo.uuid().copyWith(title: title, contents: contents),
    ]);
  }

  void toggleUpdate() {
    ref.read(memoStateProvider).state = ref
        .read(memoStateProvider)
        .state
        .copyWith(isLoading: !ref.read(memoStateProvider).state.isLoading);
  }
}
