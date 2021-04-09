import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class Model with ModelMixin {}

mixin ModelMixin {
  @protected
  ProviderReference get ref;
}
