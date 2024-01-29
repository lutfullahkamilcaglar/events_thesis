import 'package:equatable/equatable.dart';

import '../../../../data/model/util/loadable_completion_state.dart';
import '../../../../data/model/waiting_user.dart';

class ApproveUsersViewState extends Equatable {
  final List<WaitingUser> waitList;
  final LoadableCompletionState completionState;
  final Map<String, bool> waitListLoadSet;

  const ApproveUsersViewState({
    this.waitList = const [],
    required this.completionState,
    this.waitListLoadSet = const {},
  });

  ApproveUsersViewState copyWith({
    List<WaitingUser>? waitList,
    LoadableCompletionState? completionState,
    Map<String, bool>? waitListLoadSet,
  }) =>
      ApproveUsersViewState(
        waitList: waitList ?? this.waitList,
        completionState: completionState ?? this.completionState,
        waitListLoadSet: waitListLoadSet ?? this.waitListLoadSet,
      );

  @override
  List<Object> get props => [waitList, completionState, waitListLoadSet];
}
