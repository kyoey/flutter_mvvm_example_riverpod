import 'package:flutter_mvvm_example/models/controllers/model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memoState = StateProvider((_) => MemoState());

final memoModel = Provider.autoDispose((ref) {
  final memo = ref.watch(memoState);
  return MemoModel(ref, memo.state);
});

class MemoModel extends Model {
  MemoModel(this.ref, this.memoStateData);

  @override
  final ProviderReference ref;

  final MemoState memoStateData;

  void addMemo(String title, String contents) {
    ref.read(memoState).state = memoStateData.copyWith(memos: [
      ...memoStateData.memos,
      Memo.uuid().copyWith(title: title, contents: contents),
    ]);
  }

  void toggleUpdate() {
    ref.read(memoState).state =
        memoStateData.copyWith(isLoading: !memoStateData.isLoading);
  }
}
