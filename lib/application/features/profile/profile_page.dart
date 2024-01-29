import 'package:d_events/application/features/profile/bloc/profile_cubit.dart';
import 'package:d_events/application/features/profile/bloc/profile_view_state.dart';
import 'package:d_events/application/features/profile/profile_view.dart';
import 'package:d_events/data/model/util/loadable_completion_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authorization/authorization_cubit.dart';
import '../../bloc/authorization/authorization_state.dart';
import '../../di/global_dependencies.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        lambdaRepository: getIt(),
      )..onAuthorizationStateReceived(BlocProvider.of<AuthorizationCubit>(context).state),
      lazy: false,
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthorizationCubit, AuthorizationState>(
              listener: (context, state) => BlocProvider.of<ProfileCubit>(context).onAuthorizationStateReceived(state),
          ),
          BlocListener<ProfileCubit, ProfileViewState>(
            listener: (context, state) {
              if (state.completionState is Fail) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Something go wrong!'),
                ));
                BlocProvider.of<ProfileCubit>(context).onConsumeEffect();
              } else if (state.completionState is Success) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Profile updated!'),
                ));
                BlocProvider.of<ProfileCubit>(context).onConsumeEffect();
              }
            },
          ),
        ],
        child: const ProfileView(),
      ),
    );
  }
}
