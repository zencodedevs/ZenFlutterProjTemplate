import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:zen_flutter/app/injector/di.dart';
import 'package:zen_flutter/app/network/api_exception.dart';

class ApiExceptionHandler {
  static ApiException handleException(DioException e) {
    final statusCode = e.response?.statusCode;
    switch (statusCode) {
      case HttpStatus.notModified:
        return const ApiException.notModified();
      case HttpStatus.unauthorized:
        return const ApiException.unauthorized();
      case HttpStatus.badRequest:
        i.get<Logger>().severe(e);
        final data = e.response?.data as Map<String, dynamic>?;
        final errors = data?['errors'] as Map<String, dynamic>?;
        return ApiException.badRequest(errors ?? {});
      default:
        i.get<Logger>().severe(e);
        return const ApiException.unknown();
    }
  }
}
