import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'app_description_state.freezed.dart';

@freezed
abstract class AppDescriptionState with _$AppDescriptionState {
  const factory AppDescriptionState({
    @Default('') String description,
  }) = _AppDescriptionState;
}
