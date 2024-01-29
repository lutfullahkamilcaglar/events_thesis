import 'package:auto_route/auto_route.dart';
import 'package:fire/application/auth_notifier/auth_notifier.dart';
import 'package:mobx/mobx.dart';
import '../di/global_dependencies.dart';
import 'app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final notifier = getIt<AuthNotifier>();
    notifier.authState.when(
      disconnected: () => router.replaceAll([const AuthPageRoute()]),
      connected: (_) => resolver.next(true),
      loading: () => _listenChanges(notifier, resolver, router),
    );
  }

  void _listenChanges(
    AuthNotifier notifier,
    NavigationResolver resolver,
    StackRouter router,
  ) {
    late ReactionDisposer disposer;
    disposer = reaction(
      (_) => notifier.authState,
      (authState) {
        authState.whenOrNull(
          disconnected: () {
            router.replaceAll([const AuthPageRoute()]);
            disposer();
          },
          connected: (_) {
            resolver.next(true);
            disposer();
          },
        );
      },
    );
  }
}
