import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_wrapper.freezed.dart';
part 'response_wrapper.g.dart';

@Freezed(genericArgumentFactories: true)
class ResponseWrapper<T> with _$ResponseWrapper<T> {
  const ResponseWrapper._();

  // ignore: invalid_annotation_target
  @JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
  const factory ResponseWrapper({required T data}) = _ResponseWrapper;

  factory ResponseWrapper.fromJson(
          Map<String, dynamic> json, T Function(Object? jsonT) fromJsonT) =>
      _$ResponseWrapperFromJson(json, fromJsonT);
}
