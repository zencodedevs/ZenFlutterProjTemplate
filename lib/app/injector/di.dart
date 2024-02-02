import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zen_flutter/app/injector/isar_di.dart';
import 'package:zen_flutter/app/injector/local_services_di.dart';
import 'package:zen_flutter/app/injector/repository_di.dart';
import 'package:zen_flutter/app/local_services/etag_service.dart';
import 'package:zen_flutter/app/network/dio_client.dart';

GetIt get i => GetIt.instance;

Future<void> initInjector() async {
  await initIsarDi();
  final sp = await SharedPreferences.getInstance();
  await sp.reload();
  i
    ..registerSingleton(Logger('zencode'))
    ..registerSingleton(Dio())
    ..registerSingleton(sp)
    ..registerSingleton(EtagService(i.get<SharedPreferences>()))
    ..registerSingleton(DioClient(i.get<Dio>(), i.get<EtagService>()));

  initLocalServicesDi();
  await initRepositoryDi();
}
