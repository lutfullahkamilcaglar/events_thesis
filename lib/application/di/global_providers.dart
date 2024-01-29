import 'package:d_events/application/features/main/bloc/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authorization/authorization_cubit.dart';
import 'global_dependencies.dart';

class GlobalProviders extends StatelessWidget {
  final Widget child;
  const GlobalProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthorizationCubit(
            globalAuthObservable: getIt(),
            fireStoreRepository: getIt(),
            userNotifier: getIt(),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (_) =>  MainCubit(
            fireStoreRepository: getIt(),
            lambdaRepository: getIt(),
          ),
        ),
      ],
      child: child,
    );
  }
}

// FOR GLOBALLY AVAILABLE CUBITS
