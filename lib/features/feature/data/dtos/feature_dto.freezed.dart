// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureDto _$FeatureDtoFromJson(Map<String, dynamic> json) {
  return _FeatureDto.fromJson(json);
}

/// @nodoc
mixin _$FeatureDto {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureDtoCopyWith<FeatureDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureDtoCopyWith<$Res> {
  factory $FeatureDtoCopyWith(
          FeatureDto value, $Res Function(FeatureDto) then) =
      _$FeatureDtoCopyWithImpl<$Res, FeatureDto>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$FeatureDtoCopyWithImpl<$Res, $Val extends FeatureDto>
    implements $FeatureDtoCopyWith<$Res> {
  _$FeatureDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureDtoImplCopyWith<$Res>
    implements $FeatureDtoCopyWith<$Res> {
  factory _$$FeatureDtoImplCopyWith(
          _$FeatureDtoImpl value, $Res Function(_$FeatureDtoImpl) then) =
      __$$FeatureDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FeatureDtoImplCopyWithImpl<$Res>
    extends _$FeatureDtoCopyWithImpl<$Res, _$FeatureDtoImpl>
    implements _$$FeatureDtoImplCopyWith<$Res> {
  __$$FeatureDtoImplCopyWithImpl(
      _$FeatureDtoImpl _value, $Res Function(_$FeatureDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FeatureDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureDtoImpl extends _FeatureDto {
  const _$FeatureDtoImpl({required this.id}) : super._();

  factory _$FeatureDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureDtoImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'FeatureDto(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureDtoImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureDtoImplCopyWith<_$FeatureDtoImpl> get copyWith =>
      __$$FeatureDtoImplCopyWithImpl<_$FeatureDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureDtoImplToJson(
      this,
    );
  }
}

abstract class _FeatureDto extends FeatureDto {
  const factory _FeatureDto({required final int id}) = _$FeatureDtoImpl;
  const _FeatureDto._() : super._();

  factory _FeatureDto.fromJson(Map<String, dynamic> json) =
      _$FeatureDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$FeatureDtoImplCopyWith<_$FeatureDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
