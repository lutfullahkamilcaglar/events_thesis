// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
    required this.adminGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  final AdminGuard adminGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    HostPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HostPage(),
      );
    },
    CreateEventPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CreateEventPage(),
      );
    },
    ApproveUsersPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ApproveUsersPage(),
      );
    },
    AuthPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    ErrorPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ErrorPage(),
      );
    },
    MainPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HostPageRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            RouteConfig(
              MainPageRoute.name,
              path: 'home',
              parent: HostPageRoute.name,
            ),
            RouteConfig(
              ProfilePageRoute.name,
              path: 'profile',
              parent: HostPageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          CreateEventPageRoute.name,
          path: 'create-event',
          guards: [adminGuard],
        ),
        RouteConfig(
          ApproveUsersPageRoute.name,
          path: 'approve-users',
          guards: [adminGuard],
        ),
        RouteConfig(
          AuthPageRoute.name,
          path: 'auth',
        ),
        RouteConfig(
          ErrorPageRoute.name,
          path: 'error',
        ),
        RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [HostPage]
class HostPageRoute extends PageRouteInfo<void> {
  const HostPageRoute({List<PageRouteInfo>? children})
      : super(
          HostPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HostPageRoute';
}

/// generated route for
/// [CreateEventPage]
class CreateEventPageRoute extends PageRouteInfo<void> {
  const CreateEventPageRoute()
      : super(
          CreateEventPageRoute.name,
          path: 'create-event',
        );

  static const String name = 'CreateEventPageRoute';
}

/// generated route for
/// [ApproveUsersPage]
class ApproveUsersPageRoute extends PageRouteInfo<void> {
  const ApproveUsersPageRoute()
      : super(
          ApproveUsersPageRoute.name,
          path: 'approve-users',
        );

  static const String name = 'ApproveUsersPageRoute';
}

/// generated route for
/// [AuthPage]
class AuthPageRoute extends PageRouteInfo<void> {
  const AuthPageRoute()
      : super(
          AuthPageRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthPageRoute';
}

/// generated route for
/// [ErrorPage]
class ErrorPageRoute extends PageRouteInfo<void> {
  const ErrorPageRoute()
      : super(
          ErrorPageRoute.name,
          path: 'error',
        );

  static const String name = 'ErrorPageRoute';
}

/// generated route for
/// [MainPage]
class MainPageRoute extends PageRouteInfo<void> {
  const MainPageRoute()
      : super(
          MainPageRoute.name,
          path: 'home',
        );

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(
          ProfilePageRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfilePageRoute';
}
