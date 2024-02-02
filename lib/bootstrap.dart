import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:zen_flutter/app/injector/di.dart';

/// A general bloc observer that appended to [Bloc.observer].
/// Used to listen and log event-to-state changes on each kind of [Bloc]
/// and [Cubit] implementations.
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    log('Bloc created: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();

  // This disables Landscape mode
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await dotenv.load(isOptional: false);
}

/// A initialization method for Sentry.
/// [appRunner] would be the main [runApp] method that runs app.
///
/// Fore completed documentation, please refer to:
///  - https://docs.sentry.io/platforms/flutter/
Future<void> initializeSentry(
  FutureOr<void> Function() appRunner, {
  String? environment,
}) async {
  final dsn = dotenv.get('SentryDSN');
  await SentryFlutter.init(
    (options) {
      options
        ..dsn = dsn
        ..environment = environment
        ..attachScreenshot = true
        ..attachViewHierarchy = true
        ..addIntegration(LoggingIntegration());
    },
    appRunner: appRunner,
  );
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  bool enableSentry = false,
  String? environment,
}) async {
  FlutterError.onError = (error) async {
    log(error.exceptionAsString(), stackTrace: error.stack);
    await Sentry.captureException(error.exception, stackTrace: error.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      await Future.microtask(initializeApp);
      await initInjector();

      if (!enableSentry) return runApp(await builder());
      await initializeSentry(() async => runApp(await builder()), environment: environment);
    },
    (error, stackTrace) async {
      log(error.toString(), stackTrace: stackTrace);
      await Sentry.captureException(error, stackTrace: stackTrace);
    },
  );
}
