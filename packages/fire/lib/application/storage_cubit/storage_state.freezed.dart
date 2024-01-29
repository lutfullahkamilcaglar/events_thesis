// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StorageViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() running,
    required TResult Function() paused,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? running,
    TResult? Function()? paused,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? running,
    TResult Function()? paused,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageViewStateCopyWith<$Res> {
  factory $StorageViewStateCopyWith(
          StorageViewState value, $Res Function(StorageViewState) then) =
      _$StorageViewStateCopyWithImpl<$Res, StorageViewState>;
}

/// @nodoc
class _$StorageViewStateCopyWithImpl<$Res, $Val extends StorageViewState>
    implements $StorageViewStateCopyWith<$Res> {
  _$StorageViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res>
    extends _$StorageViewStateCopyWithImpl<$Res, _$_Idle>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Idle extends _Idle {
  const _$_Idle() : super._();

  @override
  String toString() {
    return 'StorageViewState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() running,
    required TResult Function() paused,
    required TResult Function() success,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? running,
    TResult? Function()? paused,
    TResult? Function()? success,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? running,
    TResult Function()? paused,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Success value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Success value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle extends StorageViewState {
  const factory _Idle() = _$_Idle;
  const _Idle._() : super._();
}

/// @nodoc
abstract class _$$_RunningCopyWith<$Res> {
  factory _$$_RunningCopyWith(
          _$_Running value, $Res Function(_$_Running) then) =
      __$$_RunningCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RunningCopyWithImpl<$Res>
    extends _$StorageViewStateCopyWithImpl<$Res, _$_Running>
    implements _$$_RunningCopyWith<$Res> {
  __$$_RunningCopyWithImpl(_$_Running _value, $Res Function(_$_Running) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Running extends _Running {
  const _$_Running() : super._();

  @override
  String toString() {
    return 'StorageViewState.running()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Running);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() running,
    required TResult Function() paused,
    required TResult Function() success,
  }) {
    return running();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? running,
    TResult? Function()? paused,
    TResult? Function()? success,
  }) {
    return running?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? running,
    TResult Function()? paused,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Success value) success,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Success value)? success,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class _Running extends StorageViewState {
  const factory _Running() = _$_Running;
  const _Running._() : super._();
}

/// @nodoc
abstract class _$$_PausedCopyWith<$Res> {
  factory _$$_PausedCopyWith(_$_Paused value, $Res Function(_$_Paused) then) =
      __$$_PausedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PausedCopyWithImpl<$Res>
    extends _$StorageViewStateCopyWithImpl<$Res, _$_Paused>
    implements _$$_PausedCopyWith<$Res> {
  __$$_PausedCopyWithImpl(_$_Paused _value, $Res Function(_$_Paused) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Paused extends _Paused {
  const _$_Paused() : super._();

  @override
  String toString() {
    return 'StorageViewState.paused()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Paused);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() running,
    required TResult Function() paused,
    required TResult Function() success,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? running,
    TResult? Function()? paused,
    TResult? Function()? success,
  }) {
    return paused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? running,
    TResult Function()? paused,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Success value) success,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Success value)? success,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused extends StorageViewState {
  const factory _Paused() = _$_Paused;
  const _Paused._() : super._();
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$StorageViewStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success extends _Success {
  const _$_Success() : super._();

  @override
  String toString() {
    return 'StorageViewState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() running,
    required TResult Function() paused,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? running,
    TResult? Function()? paused,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? running,
    TResult Function()? paused,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends StorageViewState {
  const factory _Success() = _$_Success;
  const _Success._() : super._();
}

/// @nodoc
mixin _$StorageEffect {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() error,
    required TResult Function() cancelled,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? error,
    TResult? Function()? cancelled,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? error,
    TResult Function()? cancelled,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleEffect value) idle,
    required TResult Function(_ErrorEffect value) error,
    required TResult Function(_CancelledEffect value) cancelled,
    required TResult Function(_SuccessEffect value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleEffect value)? idle,
    TResult? Function(_ErrorEffect value)? error,
    TResult? Function(_CancelledEffect value)? cancelled,
    TResult? Function(_SuccessEffect value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleEffect value)? idle,
    TResult Function(_ErrorEffect value)? error,
    TResult Function(_CancelledEffect value)? cancelled,
    TResult Function(_SuccessEffect value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageEffectCopyWith<$Res> {
  factory $StorageEffectCopyWith(
          StorageEffect value, $Res Function(StorageEffect) then) =
      _$StorageEffectCopyWithImpl<$Res, StorageEffect>;
}

/// @nodoc
class _$StorageEffectCopyWithImpl<$Res, $Val extends StorageEffect>
    implements $StorageEffectCopyWith<$Res> {
  _$StorageEffectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_IdleEffectCopyWith<$Res> {
  factory _$$_IdleEffectCopyWith(
          _$_IdleEffect value, $Res Function(_$_IdleEffect) then) =
      __$$_IdleEffectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IdleEffectCopyWithImpl<$Res>
    extends _$StorageEffectCopyWithImpl<$Res, _$_IdleEffect>
    implements _$$_IdleEffectCopyWith<$Res> {
  __$$_IdleEffectCopyWithImpl(
      _$_IdleEffect _value, $Res Function(_$_IdleEffect) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_IdleEffect extends _IdleEffect {
  const _$_IdleEffect() : super._();

  @override
  String toString() {
    return 'StorageEffect.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_IdleEffect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() error,
    required TResult Function() cancelled,
    required TResult Function() success,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? error,
    TResult? Function()? cancelled,
    TResult? Function()? success,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? error,
    TResult Function()? cancelled,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleEffect value) idle,
    required TResult Function(_ErrorEffect value) error,
    required TResult Function(_CancelledEffect value) cancelled,
    required TResult Function(_SuccessEffect value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleEffect value)? idle,
    TResult? Function(_ErrorEffect value)? error,
    TResult? Function(_CancelledEffect value)? cancelled,
    TResult? Function(_SuccessEffect value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleEffect value)? idle,
    TResult Function(_ErrorEffect value)? error,
    TResult Function(_CancelledEffect value)? cancelled,
    TResult Function(_SuccessEffect value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleEffect extends StorageEffect {
  const factory _IdleEffect() = _$_IdleEffect;
  const _IdleEffect._() : super._();
}

/// @nodoc
abstract class _$$_ErrorEffectCopyWith<$Res> {
  factory _$$_ErrorEffectCopyWith(
          _$_ErrorEffect value, $Res Function(_$_ErrorEffect) then) =
      __$$_ErrorEffectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorEffectCopyWithImpl<$Res>
    extends _$StorageEffectCopyWithImpl<$Res, _$_ErrorEffect>
    implements _$$_ErrorEffectCopyWith<$Res> {
  __$$_ErrorEffectCopyWithImpl(
      _$_ErrorEffect _value, $Res Function(_$_ErrorEffect) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ErrorEffect extends _ErrorEffect {
  const _$_ErrorEffect() : super._();

  @override
  String toString() {
    return 'StorageEffect.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ErrorEffect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() error,
    required TResult Function() cancelled,
    required TResult Function() success,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? error,
    TResult? Function()? cancelled,
    TResult? Function()? success,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? error,
    TResult Function()? cancelled,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleEffect value) idle,
    required TResult Function(_ErrorEffect value) error,
    required TResult Function(_CancelledEffect value) cancelled,
    required TResult Function(_SuccessEffect value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleEffect value)? idle,
    TResult? Function(_ErrorEffect value)? error,
    TResult? Function(_CancelledEffect value)? cancelled,
    TResult? Function(_SuccessEffect value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleEffect value)? idle,
    TResult Function(_ErrorEffect value)? error,
    TResult Function(_CancelledEffect value)? cancelled,
    TResult Function(_SuccessEffect value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorEffect extends StorageEffect {
  const factory _ErrorEffect() = _$_ErrorEffect;
  const _ErrorEffect._() : super._();
}

/// @nodoc
abstract class _$$_CancelledEffectCopyWith<$Res> {
  factory _$$_CancelledEffectCopyWith(
          _$_CancelledEffect value, $Res Function(_$_CancelledEffect) then) =
      __$$_CancelledEffectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CancelledEffectCopyWithImpl<$Res>
    extends _$StorageEffectCopyWithImpl<$Res, _$_CancelledEffect>
    implements _$$_CancelledEffectCopyWith<$Res> {
  __$$_CancelledEffectCopyWithImpl(
      _$_CancelledEffect _value, $Res Function(_$_CancelledEffect) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CancelledEffect extends _CancelledEffect {
  const _$_CancelledEffect() : super._();

  @override
  String toString() {
    return 'StorageEffect.cancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CancelledEffect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() error,
    required TResult Function() cancelled,
    required TResult Function() success,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? error,
    TResult? Function()? cancelled,
    TResult? Function()? success,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? error,
    TResult Function()? cancelled,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleEffect value) idle,
    required TResult Function(_ErrorEffect value) error,
    required TResult Function(_CancelledEffect value) cancelled,
    required TResult Function(_SuccessEffect value) success,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleEffect value)? idle,
    TResult? Function(_ErrorEffect value)? error,
    TResult? Function(_CancelledEffect value)? cancelled,
    TResult? Function(_SuccessEffect value)? success,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleEffect value)? idle,
    TResult Function(_ErrorEffect value)? error,
    TResult Function(_CancelledEffect value)? cancelled,
    TResult Function(_SuccessEffect value)? success,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class _CancelledEffect extends StorageEffect {
  const factory _CancelledEffect() = _$_CancelledEffect;
  const _CancelledEffect._() : super._();
}

/// @nodoc
abstract class _$$_SuccessEffectCopyWith<$Res> {
  factory _$$_SuccessEffectCopyWith(
          _$_SuccessEffect value, $Res Function(_$_SuccessEffect) then) =
      __$$_SuccessEffectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessEffectCopyWithImpl<$Res>
    extends _$StorageEffectCopyWithImpl<$Res, _$_SuccessEffect>
    implements _$$_SuccessEffectCopyWith<$Res> {
  __$$_SuccessEffectCopyWithImpl(
      _$_SuccessEffect _value, $Res Function(_$_SuccessEffect) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SuccessEffect extends _SuccessEffect {
  const _$_SuccessEffect() : super._();

  @override
  String toString() {
    return 'StorageEffect.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SuccessEffect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() error,
    required TResult Function() cancelled,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? error,
    TResult? Function()? cancelled,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? error,
    TResult Function()? cancelled,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleEffect value) idle,
    required TResult Function(_ErrorEffect value) error,
    required TResult Function(_CancelledEffect value) cancelled,
    required TResult Function(_SuccessEffect value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleEffect value)? idle,
    TResult? Function(_ErrorEffect value)? error,
    TResult? Function(_CancelledEffect value)? cancelled,
    TResult? Function(_SuccessEffect value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleEffect value)? idle,
    TResult Function(_ErrorEffect value)? error,
    TResult Function(_CancelledEffect value)? cancelled,
    TResult Function(_SuccessEffect value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessEffect extends StorageEffect {
  const factory _SuccessEffect() = _$_SuccessEffect;
  const _SuccessEffect._() : super._();
}
