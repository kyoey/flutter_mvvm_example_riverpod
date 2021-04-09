import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/models/controllers/memo_model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// viewModelでのみ保持するState
class _ViewState {
  final int count;

  _ViewState(this.count);
}

final _viewStateProvider = StateProvider((_) => _ViewState(0));

/// ViewModelのProvider
final homeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  // ViewModelでのみ保持するState
  final viewState = ref.watch(_viewStateProvider).state;
  // GlobalなState
  final appState = ref.watch(appStateProvider).state;
  final memoState = ref.watch(memoStateProvider).state;

  return _HomeViewModel(ref, viewState, appState, memoState);
});

/// ViewModel
class _HomeViewModel extends ViewModel {
  _HomeViewModel(
    this.ref,
    this.viewState,
    this.appState,
    this.memoState,
  );

  @override
  final ProviderReference ref;
  final _ViewState viewState;
  final AppState appState;
  final MemoState memoState;

  void onTapAddMemo() {
    ref.read(_viewStateProvider).state = _ViewState(viewState.count + 1);
    final title = 'count: ${viewState.count}';
    final contents = 'このcountはViewModelでだけ保持している値';

    ref.read(memoModelProvider).addMemo(title, contents);
  }
}
