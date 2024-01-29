import 'dart:async';

import 'package:d_events/data/firestore_repository.dart';
import 'package:fire/application/auth_notifier/user_notifier.dart';
import 'package:fire/application/global_auth_observable/global_auth_observable.dart';
import 'package:fire/application/global_auth_observable/global_auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/user.dart';
import 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final FireStoreRepository _fireStoreRepository;

  late StreamSubscription<GlobalAuthViewState> _streamSubscription;
  StreamSubscription<User?>? _userSubscription;
  late final UserNotifier<User> _userNotifier;

  AuthorizationCubit({
    required GlobalAuthObservable globalAuthObservable,
    required FireStoreRepository fireStoreRepository,
    required UserNotifier<User> userNotifier,
  })  : _fireStoreRepository = fireStoreRepository,
        _userNotifier = userNotifier,
        super(LoadingState()) {
    _streamSubscription =
        globalAuthObservable.stream.listen(_authStreamHandler);
    _authStreamHandler(globalAuthObservable.state);
  }

  void _authStreamHandler(GlobalAuthViewState event) {
    event.maybeWhen(
      connected: (user) => _consumeUserStream(user.uid),
      orElse: _cancelActiveStream,
    );
  }

  void _cancelActiveStream() async {
    emit(NotActiveState());
    await _userSubscription?.cancel();
  }

  void _consumeUserStream(String uid) async {
    emit(LoadingState());
    await _userSubscription?.cancel();
    final userStream = _fireStoreRepository.getUserDataStream(uid);
    _userSubscription = userStream.listen(_handleUserEvent);
  }

  void _handleUserEvent(User? user) {
    if (user == null) {
      emit(ErrorViewState());
      _userNotifier.clear();
    } else if (user.isActive) {
      emit(ActiveState(user));
      _userNotifier.onUserReceived(user);
    } else {
      emit(NotActiveState());
      _userNotifier.onUserReceived(user);
    }
  }

  void cancelSubscriptions() async {
    await _userSubscription?.cancel();
  }

  @override
  Future<void> close() async {
    await _userSubscription?.cancel();
    await _streamSubscription.cancel();
    return super.close();
  }
}
