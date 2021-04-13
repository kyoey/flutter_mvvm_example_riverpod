// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'debug_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DebugDataTearOff {
  const _$DebugDataTearOff();

  _DebugData call({DebugType debugType = DebugType.A}) {
    return _DebugData(
      debugType: debugType,
    );
  }
}

/// @nodoc
const $DebugData = _$DebugDataTearOff();

/// @nodoc
mixin _$DebugData {
  DebugType get debugType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DebugDataCopyWith<DebugData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebugDataCopyWith<$Res> {
  factory $DebugDataCopyWith(DebugData value, $Res Function(DebugData) then) =
      _$DebugDataCopyWithImpl<$Res>;
  $Res call({DebugType debugType});
}

/// @nodoc
class _$DebugDataCopyWithImpl<$Res> implements $DebugDataCopyWith<$Res> {
  _$DebugDataCopyWithImpl(this._value, this._then);

  final DebugData _value;
  // ignore: unused_field
  final $Res Function(DebugData) _then;

  @override
  $Res call({
    Object? debugType = freezed,
  }) {
    return _then(_value.copyWith(
      debugType: debugType == freezed
          ? _value.debugType
          : debugType // ignore: cast_nullable_to_non_nullable
              as DebugType,
    ));
  }
}

/// @nodoc
abstract class _$DebugDataCopyWith<$Res> implements $DebugDataCopyWith<$Res> {
  factory _$DebugDataCopyWith(
          _DebugData value, $Res Function(_DebugData) then) =
      __$DebugDataCopyWithImpl<$Res>;
  @override
  $Res call({DebugType debugType});
}

/// @nodoc
class __$DebugDataCopyWithImpl<$Res> extends _$DebugDataCopyWithImpl<$Res>
    implements _$DebugDataCopyWith<$Res> {
  __$DebugDataCopyWithImpl(_DebugData _value, $Res Function(_DebugData) _then)
      : super(_value, (v) => _then(v as _DebugData));

  @override
  _DebugData get _value => super._value as _DebugData;

  @override
  $Res call({
    Object? debugType = freezed,
  }) {
    return _then(_DebugData(
      debugType: debugType == freezed
          ? _value.debugType
          : debugType // ignore: cast_nullable_to_non_nullable
              as DebugType,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_DebugData extends _DebugData {
  const _$_DebugData({this.debugType = DebugType.A}) : super._();

  @JsonKey(defaultValue: DebugType.A)
  @override
  final DebugType debugType;

  @override
  String toString() {
    return 'DebugData(debugType: $debugType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DebugData &&
            (identical(other.debugType, debugType) ||
                const DeepCollectionEquality()
                    .equals(other.debugType, debugType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(debugType);

  @JsonKey(ignore: true)
  @override
  _$DebugDataCopyWith<_DebugData> get copyWith =>
      __$DebugDataCopyWithImpl<_DebugData>(this, _$identity);
}

abstract class _DebugData extends DebugData {
  const factory _DebugData({DebugType debugType}) = _$_DebugData;
  const _DebugData._() : super._();

  @override
  DebugType get debugType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DebugDataCopyWith<_DebugData> get copyWith =>
      throw _privateConstructorUsedError;
}
