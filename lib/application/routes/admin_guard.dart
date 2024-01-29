import 'package:auto_route/auto_route.dart';
import 'package:d_events/domain/model/user.dart';
import 'package:fire/application/auth_notifier/user_notifier.dart';

import '../di/global_dependencies.dart';

class AdminGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final notifier = getIt<UserNotifier<User>>();
    final user = notifier.user;
    if (user != null && user.isAdmin) {
      resolver.next(true);
    } else {
      resolver.next(false);
    }
  }
}
