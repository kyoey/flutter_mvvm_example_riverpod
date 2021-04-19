import 'package:flutter_mvvm_example/models/controllers/model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ModelのProvider
final memoModelProvider = StateNotifierProvider<MemoModel, MemoState>((ref) {
  return MemoModel();
});

/// Model
class MemoModel extends Model<MemoState> {
  MemoModel() : super(MemoState());

  void addMemo(String title, String contents) {
    state = state.copyWith(memos: [
      ...state.memos,
      Memo.uuid().copyWith(title: title, contents: contents),
    ]);
  }

  void toggleUpdate() {
    state = state.copyWith(
      isLoading: !state.isLoading,
    );
  }
}
