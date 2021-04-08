import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/models/controllers/memo_model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// homeViewModelで使うState
/// - ViewModel内でだけ保持するState
/// - GlobalState

class _homeViewModelState {
  // ViewModelでのみ保持
  final int count;
  // GlobalState
  final String title;
  final List<Memo> memos;

  const _homeViewModelState(this.count, this.title, this.memos);
}

/// デフォルト値を指定
final _homeViewModelStateProvider =
    StateProvider((_) => _homeViewModelState(0, '', []));

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<_HomeViewModel, _homeViewModelState>(
        (ref) {
  // ViewModelでのみ保持
  final count = ref.watch(_homeViewModelStateProvider).state.count;
  // GlobalState
  final title = ref.watch(appState).state.title;
  final memos = ref.watch(memoState).state.memos;
  final state = _homeViewModelState(count, title, memos);

  return _HomeViewModel(ref, state);
});

class _HomeViewModel extends ViewModel<_homeViewModelState> {
  _HomeViewModel(this.ref, _homeViewModelState state) : super(state);

  @override
  final ProviderReference ref;
  String get title => state.title;
  List<Memo> get memos => state.memos;

  void onTapAddMemo() {
    ref.read(_homeViewModelStateProvider).state =
        _homeViewModelState(state.count + 1, state.title, memos);
    final title = 'count: ${state.count}';
    final contents = 'このcountはViewModelでだけ保持している値';

    ref.read(memoModel).addMemo(title, contents);
  }
}
