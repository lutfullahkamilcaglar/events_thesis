import 'package:auto_route/auto_route.dart';
import 'package:fire/application/global_auth_observable/global_auth_observable.dart';
import 'package:fire/application/global_auth_observable/global_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/global_dependencies.dart';
import '../../routes/app_router.dart';
import 'host_view.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return BlocConsumer<GlobalAuthObservable, GlobalAuthViewState>(
      bloc: getIt<GlobalAuthObservable>(),
      listener: (context, viewState) {
        viewState.whenOrNull(
          disconnected: () => router.replaceNamed(NavRoutes.authPage),
        );
      },
      builder: (context, viewState) {
        return viewState.maybeWhen(
          connected: (user) => const HostView(),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
