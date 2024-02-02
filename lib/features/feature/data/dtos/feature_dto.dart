import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zen_flutter/features/feature/domain/entities/feature.dart';

part 'feature_dto.freezed.dart';
part 'feature_dto.g.dart';

@freezed
class FeatureDto with _$FeatureDto {
  const FeatureDto._();

  const factory FeatureDto({required int id}) = _FeatureDto;

  factory FeatureDto.fromJson(Map<String, dynamic> json) => _$FeatureDtoFromJson(json);

  Feature toDomain() => Feature(id: id);

  FeatureDto fromDomain(Feature _) => FeatureDto(id: _.id);
}
