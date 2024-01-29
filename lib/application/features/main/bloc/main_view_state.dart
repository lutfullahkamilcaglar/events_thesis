import 'package:equatable/equatable.dart';

import '../../../../data/model/util/effect_state.dart';
import '../../../../domain/model/event.dart';
import '../../../../domain/model/user.dart';

class MainViewState extends Equatable {
  final List<Event> events;
  final Map<String, bool> callInProgress;
  final bool isLoading;
  final List<AttendingEvent> userAttendance;
  final EffectState effectState;

  const MainViewState({
    this.events = const [],
    this.callInProgress = const {},
    this.isLoading = false,
    this.userAttendance = const [],
    required this.effectState,
  });

  MainViewState copyWith({
    List<Event>? events,
    Map<String, bool>? callInProgress,
    bool? isLoading,
    List<AttendingEvent>? userAttendance,
    EffectState? effectState,
  }) {
    return MainViewState(
      events: events ?? this.events,
      callInProgress: callInProgress ?? this.callInProgress,
      isLoading: isLoading ?? this.isLoading,
      userAttendance: userAttendance ?? this.userAttendance,
      effectState: effectState ?? this.effectState,
    );
  }

  @override
  List<Object> get props => [events, callInProgress, isLoading, userAttendance, effectState];
}
