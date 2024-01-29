import 'package:d_events/data/model/util/completion_state.dart';
import 'package:equatable/equatable.dart';

class CreateEventViewState extends Equatable {
  final String title;
  final String description;
  final String eventLink;
  final DateTime date;
  final bool isLoading;
  final CompletionState completionState;

   const CreateEventViewState({
    this.title = "",
    this.description = "",
    this.eventLink = "",
    this.isLoading = false,
    required this.completionState,
    required this.date,
  });

  CreateEventViewState copyWith({
    String? title,
    String? description,
    String? eventLink,
    DateTime? date,
    bool? isLoading,
    CompletionState? completionState,
  }) =>
      CreateEventViewState(
        title: title ?? this.title,
        description: description ?? this.description,
        eventLink: eventLink ?? this.eventLink,
        date: date ?? this.date,
        isLoading: isLoading ?? this.isLoading,
        completionState: completionState ?? this.completionState,
      );

  @override
  List<Object> get props => [title, description, eventLink, date, isLoading, completionState];
}
