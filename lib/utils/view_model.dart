import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_example/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ViewModel<T> extends StateNotifier<T> with ViewModelMixin {
  ViewModel(state) : super(state);
}

mixin ViewModelMixin {
  @protected
  ProviderReference get ref;

  BuildContext get buildContext =>
      ref.read(navigatorKeyProvider).currentState!.overlay!.context;
}
