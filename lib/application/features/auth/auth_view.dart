import 'package:d_events/application/features/auth/login/login_page.dart';
import 'package:d_events/application/features/auth/signup/signup_page.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: tabController.index == 1
            ? IconButton(
                color: Colors.pink,
                onPressed: () => goToIndex(0),
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallSize = constraints.maxWidth <= 1000;
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              LoginPage(
                goSignUpPage: () => goToIndex(1),
                isSmallSize: isSmallSize,
              ),
              SignUpPage(isSmallSize: isSmallSize),
            ],
          );
        }
      ),
    );
  }

  void goToIndex(int index) {
    tabController.animateTo(index);
    setState(() {});
  }
}
