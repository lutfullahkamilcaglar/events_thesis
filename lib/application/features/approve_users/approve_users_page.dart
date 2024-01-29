import 'package:d_events/application/features/approve_users/bloc/approve_users_view_state.dart';
import 'package:d_events/data/model/util/loadable_completion_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/global_dependencies.dart';
import 'approve_users_view.dart';
import 'bloc/approve_users_cubit.dart';

class ApproveUsersPage extends StatelessWidget {
  const ApproveUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ApproveUsersCubit(
        lambdaRepository: getIt(),
      )..getUserWaitList(),
      child: BlocListener<ApproveUsersCubit, ApproveUsersViewState>(
        listener: (context, state) {
          if (state.completionState is Fail) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Something go wrong!'),
            ));
            BlocProvider.of<ApproveUsersCubit>(context).onFailureReceived();
          }
        },
        child: const ApproveUsersView(),
      ),
    );
  }
}
