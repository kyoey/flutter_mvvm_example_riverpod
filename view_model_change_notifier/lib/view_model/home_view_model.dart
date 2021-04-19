import 'dart:async';

import 'package:flutter_mvvm_example/models/app_state/app_state.dart';
import 'package:flutter_mvvm_example/models/controllers/app_model.dart';
import 'package:flutter_mvvm_example/models/controllers/memo_model.dart';
import 'package:flutter_mvvm_example/models/memo/memo.dart';
import 'package:flutter_mvvm_example/repositories/hoge_repository.dart';
import 'package:flutter_mvvm_example/utils/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ViewModelのProvider
final homeViewModelProvider = ChangeNotifierProvider(
  (ref) => _HomeViewModel(
    ref.read,
  ),
);

/// ViewModel
class _HomeViewModel extends ViewModel {
  _HomeViewModel(
    this.read,
  );

  @override
  final Reader read;

  /// Model
  AppModel get appModel => read(appModelProvider.notifier);
  MemoModel get memoModel => read(memoModelProvider.notifier);

  /// Repositories
  HogeRepository get _hogeRepository => read(hogeRepositoryProvider);

  int _count = 0;
  int get count => _count;

  void onTapAddMemo() async {
    _count++;
    final title = 'count: $count';
    final contents = 'このcountはViewModelでだけ保持している値';

    // final result = await _hogeRepository.fetchHoge();
    // if (result) {
    memoModel.addMemo(title, contents);
    // }
  }
}
