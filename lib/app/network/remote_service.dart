import 'package:dio/dio.dart';
import 'package:zen_flutter/app/injector/di.dart';
import 'package:zen_flutter/app/network/api_exception.dart';
import 'package:zen_flutter/app/network/api_exception_handler.dart';
import 'package:zen_flutter/app/network/dio_client.dart';
import 'package:zen_flutter/app/network/response_wrapper.dart';
import 'package:zen_flutter/app/utils/connectivity.dart';

/// [RemoteService] is a class responsible for http requests
class RemoteService<T> {
  final _dio = i.get<DioClient>().dio;

  Future<void> _checkConnection() async {
    final hasConnection = await ConnectivityUtils.isConnected;
    if (!hasConnection) throw const ApiException.notConnection();
  }

  /// [get] http get methode that returns [Dio] [Response]
  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    await _checkConnection();
    try {
      final result = await _dio.get<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return result;
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }

  /// [getSingle] http get methode that returns [T],
  /// [fromJson] is required to deserialize the response
  ///
  /// if status is OK it returns  [T]
  /// else throws an [ApiException]
  ///
  /// ```dart
  /// getSingle('path',fromJson: Dto.fromJson);
  /// ```
  Future<T?> getSingle(
    String path, {
    required T Function(Map<String, dynamic> json) fromJson,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    await _checkConnection();
    try {
      final result = await _dio.get<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      final jsonData = result.data!;
      final response = ResponseWrapper.fromJson(
        jsonData,
        (jsonT) => jsonT == null ? null : fromJson(jsonT as Map<String, dynamic>),
      );

      return response.data;
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }

  /// [getList] http get methode that returns [List<T>],
  /// [fromJson] is required to deserialize the response
  ///
  /// if status is OK it returns  [T]
  /// else throws an [ApiException]
  ///
  /// ```dart
  /// getList('path',fromJson: Dto.fromJson);
  /// ```
  Future<Iterable<T>> getList(
    String path, {
    required T Function(Map<String, dynamic> json) fromJson,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    await _checkConnection();
    try {
      final result = await _dio.get<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      final jsonData = result.data!;
      final response = ResponseWrapper.fromJson(
        jsonData,
        (jsonT) {
          final dtos = <T>[];
          final jsonList = jsonT as List<dynamic>? ?? [];
          for (final element in jsonList) {
            dtos.add(fromJson(element as Map<String, dynamic>));
          }
          return dtos;
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }

  /// Method to make http POST request
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    await _checkConnection();
    try {
      final result = await _dio.post<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return result.data?['data'];
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }

  /// Method to make http PUT request
  Future<dynamic> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    await _checkConnection();
    try {
      final result = await _dio.put<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return result.data?['data'];
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }

  /// Method to make http PATCH request
  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    await _checkConnection();
    try {
      final result = await _dio.patch<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return result.data?['data'];
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }

  /// Method to make http DELETE request
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      await _checkConnection();
      final result = await _dio.delete<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return result.data;
    } on DioException catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }
}
