import 'package:auto_route/auto_route.dart';
import 'package:d_events/application/routes/app_router.dart';
import 'package:fire/application/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

import '../../../bloc/authorization/authorization_state.dart';
import '../../../di/global_dependencies.dart';
import '../../../resource/theme_color.dart';

class HostDrawer extends StatelessWidget {
  final Function(int) setActiveIndex;
  final AuthorizationState state;

  const HostDrawer({
    Key? key,
    required this.setActiveIndex,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconColor = ThemeColor.DarkPetrol;
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      backgroundColor: ThemeColor.White,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(
                    Icons.dashboard_rounded,
                    color: iconColor,
                ),
                title: const Text("Dashboard"),
                onTap: () => setActiveIndex(0),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_2_rounded,
                  color: iconColor,
                ),
                title: const Text("Profile"),
                onTap: () => setActiveIndex(1),
              ),
              ..._adminList(iconColor, context.router.pushNamed),
            ],
          ),
          const Spacer(),
          ListTile(
            title: const Text("Log out"),
            leading: const Icon(Icons.logout_rounded),
            onTap: getIt<AuthCubit>().signOut,
            iconColor: iconColor,
          ),
        ],
      ),
    );
  }

  List<Widget> _adminList(Color iconColor, Function(String) push) {
    final shouldShowAdminSelections = state is ActiveState && (state as ActiveState).user.isAdmin;
    return shouldShowAdminSelections ? [
      ListTile(
        leading: Icon(
          Icons.event_available_rounded,
          color: iconColor,
        ),
        title: const Text("Create event"),
        onTap: () => push(NavRoutes.createEventPage),
      ),
      ListTile(
        leading: Icon(
          Icons.verified_rounded,
          color: iconColor,
        ),
        title: const Text("Approve users"),
        onTap: () => push(NavRoutes.approveUsersPage),
      ),
    ] : [];
  }
}
