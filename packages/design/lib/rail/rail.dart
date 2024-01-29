import 'package:flutter/material.dart';
import '../notifiers/theme_notifier.dart';
import 'ui/logout_button.dart';

class IRail extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final Function(int) setIndex;
  final Function() logout;
  final int selectedIndex;
  final bool extended;

  const IRail({
    Key? key,
    required this.setIndex,
    required this.selectedIndex,
    required this.extended,
    required this.themeNotifier,
    required this.logout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double width = 56.0;
    const double extendedWidth = 220.0;

    return NavigationRail(
      minWidth: width,
      minExtendedWidth: extendedWidth,
      extended: extended,
      elevation: 2,
      useIndicator: true,
      onDestinationSelected: setIndex,
      selectedIndex: selectedIndex,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.dashboard_rounded),
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text("Dashboard"),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.post_add_rounded),
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text("New Summary"),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ],
      trailing: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LogoutButton(
              isExtended: extended,
              width: width,
              extendedWidth: extendedWidth,
              onClick: logout,
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
