import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_flutter/app/navigation/router.dart';
import 'package:zen_flutter/features/feature/presentation/bloc/feature_cubit.dart';
import 'package:zen_flutter/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FeatureCubit()),
        //   add BLoCs here
      ],
      child: const _Starter(),
    );
  }
}

class _Starter extends StatelessWidget {
  const _Starter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(appBarTheme: AppBarTheme()),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routeInformationParser: goRouter.routeInformationParser,
          routeInformationProvider: goRouter.routeInformationProvider,
          backButtonDispatcher: goRouter.backButtonDispatcher,
          routerDelegate: goRouter.routerDelegate,
        );
      },
    );
  }
}
