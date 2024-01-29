import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NavObserver extends AutoRouterObserver {
  final Logger _logger;
  final logNavigation = false; //kDebugMode;

  NavObserver(this._logger);

  @override
  void didPush(Route route, Route? previousRoute) {
    _log("didPush, route: ${getRouteName(route)}, previousRoute: ${getRouteName(previousRoute)}");
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _log("didInitTabRoute, route: ${route.name}, previousRoute: ${previousRoute?.name}");
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _log("didChangeTabRoute, route: ${route.name}, previousRoute: ${previousRoute.name}");
  }

  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _log("didPop, route: ${getRouteName(route)}, previousRoute: ${getRouteName(previousRoute)}");
  }

  @override
  void didRemove(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _log("didRemove, route: ${getRouteName(route)}, previousRoute: ${getRouteName(previousRoute)}");
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _log("didReplace, newRoute: ${getRouteName(newRoute)}, oldRoute: ${getRouteName(oldRoute)}");
  }

  String? getRouteName(Route? route) => route?.settings.name;

  void _log(String message) {
    if (logNavigation) {
      _logger.i(message);
    }
  }
}