import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException implements Exception {
  const ApiException._();

  const factory ApiException.notModified() = _NotModified;

  const factory ApiException.unauthorized() = _Unautorized;

  const factory ApiException.badRequest(Map<String, dynamic> keys) = _Validation;

  const factory ApiException.unknown() = _Unknown;

  const factory ApiException.notConnection() = _NoConnection;
}
