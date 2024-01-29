import 'package:design/buttons/i_elevated_button.dart';
import 'package:design/buttons/i_loadable_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/util/loadable_completion_state.dart';
import '../../components/app_bar.dart';
import '../../resource/theme_color.dart';
import '../error/error_view.dart';
import 'bloc/approve_users_cubit.dart';
import 'bloc/approve_users_view_state.dart';

class ApproveUsersView extends StatelessWidget {
  const ApproveUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApproveUsersCubit, ApproveUsersViewState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const BasicAppBar(),
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _body(context, state),
            ),
          );
        },
    );
  }

  Widget _body(BuildContext context, ApproveUsersViewState state) {
    if (state.completionState is Loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.completionState is Fail) {
      return const Center(child: ErrorView('Unexpected error happened'));
    } else if (state.waitList.isEmpty) {
      return Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ErrorView('No users awaiting for approval'),
              const SizedBox(height: 32),
              IElevatedButton(
                childText: "Sync to receive updates",
                onPressed: () => BlocProvider.of<ApproveUsersCubit>(context).getUserWaitList(),
                backgroundColor: ThemeColor.DarkPetrol,
                foregroundColor: Colors.white,
                height: 42,
              ),
            ],
          ),
        ),
      );
    } else {
      final waitList = state.waitList;
      return Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: waitList.length,
          itemBuilder: (context, index) {
            final item = waitList[index];
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                child: ListTile(
                  onLongPress: () => BlocProvider.of<ApproveUsersCubit>(context).approveUser(item, false),
                  title: Text(item.email),
                  trailing: SizedBox(
                    width: 192,
                    child: ILoadableElevatedButton(
                      isLoading: state.waitListLoadSet[item.uid] ?? false,
                      onPressed: () => BlocProvider.of<ApproveUsersCubit>(context).approveUser(item, true),
                      backgroundColor: ThemeColor.DarkPetrol,
                      foregroundColor: Colors.white,
                      height: 42,
                      childText: "Approve",
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
