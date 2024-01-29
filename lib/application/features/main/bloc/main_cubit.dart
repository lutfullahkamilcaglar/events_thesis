import 'dart:async';

import 'package:d_events/data/model/util/effect_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../data/firestore_repository.dart';
import '../../../../data/lambda_repository.dart';
import '../../../../domain/model/event.dart';
import '../../../../domain/model/user.dart';
import '../../../bloc/authorization/authorization_state.dart';
import 'main_view_state.dart';

class MainCubit extends Cubit<MainViewState> {
  final FireStoreRepository _fireStoreRepository;
  final LambdaRepository _lambdaRepository;
  late User _user;

  bool _isEventCollectionStarted = false;
  StreamSubscription<List<Event>>? _eventStream;

  MainCubit({
    required FireStoreRepository fireStoreRepository,
    required LambdaRepository lambdaRepository,
  })  : _fireStoreRepository = fireStoreRepository,
        _lambdaRepository = lambdaRepository,
        super(MainViewState(isLoading: true, effectState: Idle()));

  void onAuthorizationStateReceived(AuthorizationState event) async {
    if (event is ActiveState) {
      _user = event.user;
      emit(state.copyWith(userAttendance: _user.attendance));
      if(!_isEventCollectionStarted) _startEventListening();
    } else {
      await _eventStream?.cancel();
      _isEventCollectionStarted = false;
    }
  }

  void _startEventListening() {
    _isEventCollectionStarted = true;
    _eventStream = _fireStoreRepository
        .getEventCollectionStream()
        .listen((events) => emit(state.copyWith(events: events, isLoading: false)));
  }

  void attendEvent(Event event) async {
    if(_user.displayName.isEmpty || _user.platformIndex == 0) {
      emit(state.copyWith(effectState: Effect("Complete profile setup before attending events")));
      return;
    }
    _setProgressUpdate(event, true);
    await _lambdaRepository.attend(event, _user.displayName, _user.platformIndex);
    _setProgressUpdate(event, false);
  }

  void cancelAttendingEvent(Event event) async {
    if(_user.displayName.isEmpty || _user.platformIndex == 0) {
      emit(state.copyWith(effectState: Effect("Complete profile setup before attending events")));
      return;
    }
    _setProgressUpdate(event, true);
    await _lambdaRepository.cancelAttendance(event, _user.displayName, _user.platformIndex);
    _setProgressUpdate(event, false);
  }

  bool? getUsersEventAttendance(Event event) => event.attendanceOf(_user.uid);

  Event eventOf(eventUid) => state.events.firstWhere((it) => it.uid == eventUid);

  void _setProgressUpdate(Event event, bool value) {
    Map<String, bool> progress = Map<String, bool>.from(state.callInProgress);
    progress[event.uid] = value;
    final newState = state.copyWith(callInProgress: progress);
    emit(newState);
  }

  void onConsumeEffect() => emit(state.copyWith(effectState: Idle()));

  Future<void> launchEventUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  @override
  Future<void> close() async {
    await _eventStream?.cancel();
    return super.close();
  }
}