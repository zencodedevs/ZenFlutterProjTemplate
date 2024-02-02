import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_response.freezed.dart';

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const factory RemoteResponse.notModified() = _NotModified<T>;

  const factory RemoteResponse.newData(T data) = _NewData<T>;

  const factory RemoteResponse.noConnection() = _NoConnection<T>;

  const factory RemoteResponse.error({String? key, String? message}) = _Error<T>;
}

extension DioErrorToRemoteResponse on DioError {
  /// Generates a [RemoteResponse] from a [DioError] with explict type of [Map<String, dynamic>].
  /// Please do not use with different explict types of [DioError].
  RemoteResponse<T> toKeyToMsgPairError<T>({
    bool decodeData = false,
    String Function(Map<String, dynamic>)? msg,
  }) {
    final dataStr = response?.data;
    if (dataStr is String) {
      try {
        final converted = jsonDecode(dataStr);
        if (converted != null) return _generate(converted as Map<String, dynamic>, msg);
      } catch (e) {
        return RemoteResponse.error(message: dataStr);
      }
    }

    late Map<String, dynamic>? data;
    if (!decodeData) {
      data = response?.data as Map<String, dynamic>?;
    } else {
      data = jsonDecode(response!.data.toString()) as Map<String, dynamic>?;
    }

    if (data == null || data['errors'] == null) {
      return const RemoteResponse.error(message: 'unknown');
    }

    return _generate(data, msg);
  }

  RemoteResponse<T> _generate<T>(
    Map<String, dynamic> data,
    String Function(Map<String, dynamic>)? msg,
  ) {
    final errors = data['errors'] as Map<String, dynamic>;
    final firstKey = errors.entries.first.key;
    final firstMsg = errors[firstKey];
    return RemoteResponse.error(key: firstKey, message: msg?.call(errors) ?? firstMsg?.toString());
  }
}
