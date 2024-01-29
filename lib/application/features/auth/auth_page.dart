import 'package:auto_route/auto_route.dart';
import 'package:fire/application/auth_cubit/auth_cubit.dart';
import 'package:fire/application/auth_cubit/auth_state.dart';
import 'package:fire/application/global_auth_observable/global_auth_observable.dart';
import 'package:fire/domain/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/global_dependencies.dart';
import '../../routes/app_router.dart';
import 'auth_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalAuth = getIt<GlobalAuthObservable>();
    globalAuth.state.whenOrNull(
      connected: (user) => context.router.replaceAll([const HostPageRoute()]),
    );
    return BlocProvider<AuthCubit>(
      create: (_) => AuthCubit(getIt<AuthRepository>()),
      lazy: false,
      child: BlocListener<AuthCubit, AuthViewState>(
        listener: (context, state) {
          state.whenOrNull(
              success: (user) => context.router.replaceAll([const HostPageRoute()]),
          );
        },
        child: const AuthView(),
      ),
    );
  }
}
