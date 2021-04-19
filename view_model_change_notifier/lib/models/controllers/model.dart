import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class Model<T> extends StateNotifier<T> {
  Model(state) : super(state);
}

mixin ModelMixin {
  @protected
  ProviderReference get ref;
}
