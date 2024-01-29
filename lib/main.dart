import 'package:auto_route/auto_route.dart';
import 'package:d_events/application/di/global_providers.dart';
import 'package:design/notifiers/theme_notifier.dart';
import 'package:design/resource/text_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'application/di/global_dependencies.dart';
import 'application/resource/theme.dart';
import 'application/routes/app_router.dart';
import 'application/routes/nav_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupDependencies();
  setPathUrlStrategy();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    final themeNotifier = getIt<ThemeNotifier>();
    return GlobalProviders(
      child: AnimatedBuilder(
        animation: themeNotifier,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            routerDelegate: AutoRouterDelegate(
                appRouter,
                navigatorObservers: () => [NavObserver(getIt())]
            ),
            routeInformationParser: appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            theme: FlexTheme.theme,
            themeMode: ThemeMode.light,
            title: TextData.title,
          );
        },
      ),
    );
  }
}
