// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailure {
  String? get key => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? key, String? message) remote,
    required TResult Function(String? key, String? message) local,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? key, String? message)? remote,
    TResult? Function(String? key, String? message)? local,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? key, String? message)? remote,
    TResult Function(String? key, String? message)? local,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Remote value) remote,
    required TResult Function(_Local value) local,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Remote value)? remote,
    TResult? Function(_Local value)? local,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Remote value)? remote,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppFailureCopyWith<AppFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res, AppFailure>;
  @useResult
  $Res call({String? key, String? message});
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteImplCopyWith<$Res>
    implements $AppFailureCopyWith<$Res> {
  factory _$$RemoteImplCopyWith(
          _$RemoteImpl value, $Res Function(_$RemoteImpl) then) =
      __$$RemoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, String? message});
}

/// @nodoc
class __$$RemoteImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$RemoteImpl>
    implements _$$RemoteImplCopyWith<$Res> {
  __$$RemoteImplCopyWithImpl(
      _$RemoteImpl _value, $Res Function(_$RemoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? message = freezed,
  }) {
    return _then(_$RemoteImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RemoteImpl implements _Remote {
  const _$RemoteImpl({this.key, this.message});

  @override
  final String? key;
  @override
  final String? message;

  @override
  String toString() {
    return 'AppFailure.remote(key: $key, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteImplCopyWith<_$RemoteImpl> get copyWith =>
      __$$RemoteImplCopyWithImpl<_$RemoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? key, String? message) remote,
    required TResult Function(String? key, String? message) local,
  }) {
    return remote(key, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? key, String? message)? remote,
    TResult? Function(String? key, String? message)? local,
  }) {
    return remote?.call(key, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? key, String? message)? remote,
    TResult Function(String? key, String? message)? local,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(key, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Remote value) remote,
    required TResult Function(_Local value) local,
  }) {
    return remote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Remote value)? remote,
    TResult? Function(_Local value)? local,
  }) {
    return remote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Remote value)? remote,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(this);
    }
    return orElse();
  }
}

abstract class _Remote implements AppFailure {
  const factory _Remote({final String? key, final String? message}) =
      _$RemoteImpl;

  @override
  String? get key;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$RemoteImplCopyWith<_$RemoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalImplCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory _$$LocalImplCopyWith(
          _$LocalImpl value, $Res Function(_$LocalImpl) then) =
      __$$LocalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, String? message});
}

/// @nodoc
class __$$LocalImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$LocalImpl>
    implements _$$LocalImplCopyWith<$Res> {
  __$$LocalImplCopyWithImpl(
      _$LocalImpl _value, $Res Function(_$LocalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? message = freezed,
  }) {
    return _then(_$LocalImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocalImpl implements _Local {
  const _$LocalImpl({this.key, this.message});

  @override
  final String? key;
  @override
  final String? message;

  @override
  String toString() {
    return 'AppFailure.local(key: $key, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalImplCopyWith<_$LocalImpl> get copyWith =>
      __$$LocalImplCopyWithImpl<_$LocalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? key, String? message) remote,
    required TResult Function(String? key, String? message) local,
  }) {
    return local(key, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? key, String? message)? remote,
    TResult? Function(String? key, String? message)? local,
  }) {
    return local?.call(key, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? key, String? message)? remote,
    TResult Function(String? key, String? message)? local,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(key, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Remote value) remote,
    required TResult Function(_Local value) local,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Remote value)? remote,
    TResult? Function(_Local value)? local,
  }) {
    return local?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Remote value)? remote,
    TResult Function(_Local value)? local,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }
}

abstract class _Local implements AppFailure {
  const factory _Local({final String? key, final String? message}) =
      _$LocalImpl;

  @override
  String? get key;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$LocalImplCopyWith<_$LocalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
