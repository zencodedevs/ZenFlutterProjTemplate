import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature.freezed.dart';

@freezed
class Feature with _$Feature {
  const factory Feature({required int id}) = _Feature;
}
