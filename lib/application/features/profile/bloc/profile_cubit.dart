import 'package:d_events/application/features/profile/bloc/profile_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/lambda_repository.dart';
import '../../../../data/model/util/loadable_completion_state.dart';
import '../../../../domain/model/user.dart';
import '../../../bloc/authorization/authorization_state.dart';

class ProfileCubit extends Cubit<ProfileViewState> {

  final LambdaRepository _lambdaRepository;
  User? _user;

  ProfileCubit({required LambdaRepository lambdaRepository})
      : _lambdaRepository = lambdaRepository,
        super(ProfileViewState(completionState: Idle()));


  void onAuthorizationStateReceived(AuthorizationState event) {
    if (event is ActiveState) {
      _user = event.user;
      emit(state.copyWith(
        displayName: _user!.displayName,
        platformIndex: _user!.platformIndex,
      ));
    } else {
      _user = null;
    }
  }


  void onUnlockClicked() {
    if (_user != null) {
      emit(state.copyWith(isLocked: false));
    }
  }

  void onSaveClicked() async {
    if (_user != null) {
      emit(state.copyWith(completionState: Loading()));
      final res = await _lambdaRepository.updateUserData(_user!.uid, state.displayName, state.platformIndex);
      if (res) {
        emit(state.copyWith(
          completionState: Success(),
          isLocked: true,
        ));
      } else {
        emit(state.copyWith(completionState: Fail()));
      }
    }
  }

  void onConsumeEffect() => emit(state.copyWith(completionState: Idle()));

  void lockScreen() {
    emit(state.copyWith(
      isLocked: true,
      displayName: _user!.displayName,
      platformIndex: _user!.platformIndex,
    ));
  }

  void onDisplayNameChanged(String value) => emit(state.copyWith(displayName: value));

  void onPlatformIndexChanged(int? value) => emit(state.copyWith(platformIndex: value));

  void onEffectConsumed() => emit(state.copyWith(completionState: Idle()));
}