import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zen_flutter/app/local_services/etag_service.dart';
import 'package:zen_flutter/app/utils/connectivity.dart';

class DioClient {
  // Default http options for [Dio].
  BaseOptions httpOptions = BaseOptions(
    baseUrl: dotenv.get('BaseUrl'),
    contentType: Headers.jsonContentType,
    followRedirects: false,
  );

  DioClient(
    this._dio,
    this._etagService,
  ) {
    _dio.options = httpOptions;

    final prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      responseHeader: true,
      requestBody: true,
    );

    final interceptorWrapper = InterceptorsWrapper(
      onError: (e, handler) async => handler.next(e),
      onRequest: (options, handler) async {
        _etagHeader(options);

        final isConnected = await ConnectivityUtils.isConnected;
        if (!isConnected) return;

        handler.next(options);
      },
      onResponse: (response, handler) {
        _etagSave(response);
        handler.next(response);
      },
    );
    _dio.interceptors.addAll([
      prettyDioLogger,
      interceptorWrapper,
    ]);
  }

  final Dio _dio;
  final EtagService _etagService;

  Dio get dio => _dio;

  bool refreshCompleted = true;

  void _etagHeader(RequestOptions options) {
    final value = _etagService.get(options.uri.path);

    if (options.method.toUpperCase() == 'GET' && value != null && value.isNotEmpty) {
      options.headers['If-None-Match'] = value;
    }
  }

  void _etagSave(Response<dynamic> response) {
    final etagBlackListUrls = [
      //   put BlackList URLs here
    ];

    if (response.requestOptions.method.toUpperCase() == 'GET' &&
        !etagBlackListUrls.contains(response.requestOptions.path)) {
      final etag = response.headers.map['ETag']?[0];
      if (etag != null && etag.isNotEmpty) {
        _etagService.save(response.realUri.path, etag);
      }
    }
  }
}
