// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_description_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppDescriptionStateTearOff {
  const _$AppDescriptionStateTearOff();

  _AppDescriptionState call({String description = ''}) {
    return _AppDescriptionState(
      description: description,
    );
  }
}

/// @nodoc
const $AppDescriptionState = _$AppDescriptionStateTearOff();

/// @nodoc
mixin _$AppDescriptionState {
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppDescriptionStateCopyWith<AppDescriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDescriptionStateCopyWith<$Res> {
  factory $AppDescriptionStateCopyWith(
          AppDescriptionState value, $Res Function(AppDescriptionState) then) =
      _$AppDescriptionStateCopyWithImpl<$Res>;
  $Res call({String description});
}

/// @nodoc
class _$AppDescriptionStateCopyWithImpl<$Res>
    implements $AppDescriptionStateCopyWith<$Res> {
  _$AppDescriptionStateCopyWithImpl(this._value, this._then);

  final AppDescriptionState _value;
  // ignore: unused_field
  final $Res Function(AppDescriptionState) _then;

  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AppDescriptionStateCopyWith<$Res>
    implements $AppDescriptionStateCopyWith<$Res> {
  factory _$AppDescriptionStateCopyWith(_AppDescriptionState value,
          $Res Function(_AppDescriptionState) then) =
      __$AppDescriptionStateCopyWithImpl<$Res>;
  @override
  $Res call({String description});
}

/// @nodoc
class __$AppDescriptionStateCopyWithImpl<$Res>
    extends _$AppDescriptionStateCopyWithImpl<$Res>
    implements _$AppDescriptionStateCopyWith<$Res> {
  __$AppDescriptionStateCopyWithImpl(
      _AppDescriptionState _value, $Res Function(_AppDescriptionState) _then)
      : super(_value, (v) => _then(v as _AppDescriptionState));

  @override
  _AppDescriptionState get _value => super._value as _AppDescriptionState;

  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(_AppDescriptionState(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_AppDescriptionState
    with DiagnosticableTreeMixin
    implements _AppDescriptionState {
  const _$_AppDescriptionState({this.description = ''});

  @JsonKey(defaultValue: '')
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppDescriptionState(description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppDescriptionState'))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppDescriptionState &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$AppDescriptionStateCopyWith<_AppDescriptionState> get copyWith =>
      __$AppDescriptionStateCopyWithImpl<_AppDescriptionState>(
          this, _$identity);
}

abstract class _AppDescriptionState implements AppDescriptionState {
  const factory _AppDescriptionState({String description}) =
      _$_AppDescriptionState;

  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppDescriptionStateCopyWith<_AppDescriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}
