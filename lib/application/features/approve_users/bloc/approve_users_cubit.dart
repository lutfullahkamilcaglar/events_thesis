import 'package:d_events/data/model/util/loadable_completion_state.dart';
import 'package:d_events/data/model/waiting_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/lambda_repository.dart';
import 'approve_users_view_state.dart';

class ApproveUsersCubit extends Cubit<ApproveUsersViewState> {

  final LambdaRepository _lambdaRepository;

  ApproveUsersCubit({required LambdaRepository lambdaRepository})
      : _lambdaRepository = lambdaRepository,
        super(ApproveUsersViewState(completionState: Idle()));


  void getUserWaitList() async {
    emit(state.copyWith(
      completionState: Loading(),
    ));
    final res = await _lambdaRepository.getUserWaitList();
    if (res != false) {
      final users = res as List<WaitingUser>;
      emit(state.copyWith(
        waitList: users,
        completionState: Success(),
      ));
    } else {
      emit(state.copyWith(
        completionState: Fail(),
      ));
    }
  }

  void approveUser(WaitingUser user, bool approval) async {
    _setProgressUpdate(user, true);
    final res = await _lambdaRepository.setUserApproval(user.uid, approval);
    if (res) {
      _removeUserFromList(user);
    } else {
      _setProgressUpdate(user, false);
    }
  }

  void _removeUserFromList(WaitingUser user) {
    state.waitList.remove(user);
    Map<String, bool> progress = Map<String, bool>.from(state.waitListLoadSet);
    progress.remove(user.uid);
    final newState = state.copyWith(waitListLoadSet: progress);
    emit(newState);
  }

  void _setProgressUpdate(WaitingUser user, bool value) {
    Map<String, bool> progress = Map<String, bool>.from(state.waitListLoadSet);
    progress[user.uid] = value;
    final newState = state.copyWith(waitListLoadSet: progress);
    emit(newState);
  }

  void onFailureReceived() {
    emit(state.copyWith(
      completionState: Idle(),
    ));
  }
}