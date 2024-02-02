import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  const factory AppFailure.remote({
    String? key,
    String? message,
  }) = _Remote;

  const factory AppFailure.local({
    String? key,
    String? message,
  }) = _Local;
}

extension DioErrorToAppFailure on DioError {
  /// Generates a [AppFailure] from a [DioError] with explict type of [Map<String, dynamic>].
  /// Please do not use with different explict types of [DioError].
  AppFailure toKeyToMsgPairFailure() {
    final dataStr = response?.data;
    if (dataStr is String) return AppFailure.remote(message: dataStr);

    // ignore: avoid_dynamic_calls
    final errors = response?.data['errors'] as Map<String, dynamic>? ?? {};
    if (errors.isEmpty) return AppFailure.remote(message: message);
    final firstKey = errors.entries.first.key;
    var firstMsg = errors[firstKey];
    if (firstMsg.runtimeType == List<dynamic>) firstMsg = (firstMsg as List)[0];
    return AppFailure.local(key: firstKey, message: firstMsg?.toString());
  }
}
