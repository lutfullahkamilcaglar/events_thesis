import 'package:auto_route/auto_route.dart';
import 'package:d_events/application/features/approve_users/approve_users_page.dart';
import 'package:d_events/application/features/create_event/create_event_page.dart';
import 'package:d_events/application/features/error/error_page.dart';
import 'package:d_events/application/features/main/main_page.dart';
import 'package:d_events/application/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import '../features/auth/auth_page.dart';
import '../features/host/host_page.dart';
import 'admin_guard.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

abstract class NavRoutes {
  static const String host = "/";
  static const String errorPage = "error";

  // Drawer
  static const String homePage = "home";
  static const String profilePage = "profile";
  static const String createEventPage = "create-event";
  static const String approveUsersPage = "approve-users";

  // Auth
  static const String authPage = "auth";
  static const String loginPage = "login";
  static const String signupPage = "signup";

  // Bottom Sheet
  static const String attendantsBottomSheet = "attendants-bottom-sheet";
}

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: NavRoutes.host,
      page: HostPage,
      guards: [AuthGuard],
      children: [
        AutoRoute(
          path: NavRoutes.homePage,
          page: MainPage,
        ),
        AutoRoute(
          path: NavRoutes.profilePage,
          page: ProfilePage,
        ),
      ],
    ),
    AutoRoute(
      path: NavRoutes.createEventPage,
      page: CreateEventPage,
      guards: [AdminGuard],
    ),
    AutoRoute(
      path: NavRoutes.approveUsersPage,
      page: ApproveUsersPage,
      guards: [AdminGuard],
    ),
    AutoRoute(
      path: NavRoutes.authPage,
      page: AuthPage,
    ),
    AutoRoute(
      path: NavRoutes.errorPage,
      page: ErrorPage,
    ),
    RedirectRoute(path: '*', redirectTo: NavRoutes.host),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard, required super.adminGuard});
}
