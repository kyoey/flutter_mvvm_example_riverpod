import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug_data.freezed.dart';

enum DebugType {
  A,
  B,
  C,
}

extension DebugTypeExtension on DebugType {
  String get baseUrl {
    switch (this) {
      case DebugType.A:
        return 'A';
      case DebugType.B:
        return 'B';
      case DebugType.C:
        return 'C';
      default:
        return 'nothing';
    }
  }
}

@freezed
abstract class DebugData with _$DebugData {
  const DebugData._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DebugData({
    @Default(DebugType.A) DebugType debugType,
  }) = _DebugData;
}
