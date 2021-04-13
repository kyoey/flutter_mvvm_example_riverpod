import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/models/controllers/memo_model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:flutter_mvvm_example/repositories/hoge_repository.dart';
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
  /// Models
  final appModel = ref.read(appModelProvider);
  final memoModel = ref.read(memoModelProvider);

  /// ViewModelでのみ保持するState
  final viewState = ref.watch(_viewStateProvider).state;

  /// GlobalなState
  final appState = ref.watch(appModel.appStateProvider).state;
  final memoState = ref.watch(memoModel.memoStateProvider).state;

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

  /// State
  final _ViewState viewState;
  final AppState appState;
  final MemoState memoState;

  /// Model
  MemoModel get _memoModel => ref.read(memoModelProvider);

  /// Repositories
  HogeRepository get _hogeRepository => ref.read(hogeRepositoryProvider);

  void onTapAddMemo() async {
    ref.read(_viewStateProvider).state = _ViewState(viewState.count + 1);
    final title = 'count: ${viewState.count}';
    final contents = 'このcountはViewModelでだけ保持している値';

    final result = await _hogeRepository.fetchHoge();
    if (result) {
      _memoModel.addMemo(title, contents);
    }
  }
}
