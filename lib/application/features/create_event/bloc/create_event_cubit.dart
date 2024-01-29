import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/lambda_repository.dart';
import '../../../../data/model/util/completion_state.dart';
import 'create_event_view_state.dart';

class CreateEventCubit extends Cubit<CreateEventViewState> {

  final LambdaRepository _lambdaRepository;

  CreateEventCubit({required LambdaRepository lambdaRepository})
      : _lambdaRepository = lambdaRepository,
        super(CreateEventViewState(
          date: DateTime.now(),
          completionState: Idle(),
        ));

  void onTitleChanged(String value) => emit(state.copyWith(title: value));

  void onDescriptionChanged(String value) => emit(state.copyWith(description: value));

  void onEventLinkChanged(String value) => emit(state.copyWith(eventLink: value));

  void onSelectedDateChanged(DateTime value) => emit(state.copyWith(date: value));

  void onSubmit() async {
    emit(state.copyWith(isLoading: true));
    final res = await _lambdaRepository.createEvent(
      title: state.title,
        description: state.description,
        eventLink: state.eventLink,
        eventDate: state.date,
    );
    emit(state.copyWith(
      isLoading: false,
      completionState: res ? Success() : Fail(),
    ));
  }

  void onSuccessReceived() {
    emit(CreateEventViewState(
      completionState: Idle(),
      date: DateTime.now(),
    ));
  }

  void onFailureReceived() {
    emit(state.copyWith(
      completionState: Idle(),
    ));
  }
}