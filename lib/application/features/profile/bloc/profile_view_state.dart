import 'package:equatable/equatable.dart';

import '../../../../data/model/util/loadable_completion_state.dart';

class ProfileViewState extends Equatable {
  final String displayName;
  final int platformIndex;
  final LoadableCompletionState completionState;
  final bool isLocked;

  const ProfileViewState({
    this.displayName = "",
    this.platformIndex = 0,
    required this.completionState,
    this.isLocked = true,
  });

  ProfileViewState copyWith({
    String? displayName,
    int? platformIndex,
    LoadableCompletionState? completionState,
    bool? isLocked,
  }) =>
      ProfileViewState(
        displayName: displayName ?? this.displayName,
        platformIndex: platformIndex ?? this.platformIndex,
        completionState: completionState ?? this.completionState,
        isLocked: isLocked ?? this.isLocked,
      );

  @override
  List<Object> get props => [displayName, platformIndex, completionState, isLocked];
}
