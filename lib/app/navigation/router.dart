import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:zen_flutter/app/navigation/go_router_observer.dart';
import 'package:zen_flutter/features/feature/presentation/screens/feature_screen.dart';

export 'extensions.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  observers: [
    GoRouterObserver(),
    SentryNavigatorObserver(),
  ],
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => FeatureScreen(),
    ),
  ],
);
