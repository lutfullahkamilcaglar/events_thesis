import 'package:d_events/application/features/create_event/bloc/create_event_view_state.dart';
import 'package:design/buttons/i_outlined_button.dart';
import 'package:design/textfield/i_text_field.dart';
import 'package:design/textfield/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/util/completion_state.dart';
import '../bloc/create_event_cubit.dart';

class EventForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final DateTime date;
  const EventForm({Key? key, required this.formKey, required this.date}) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController eventLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateEventCubit, CreateEventViewState>(
      listener: (context, state) {
        final cubit = BlocProvider.of<CreateEventCubit>(context);
        final completionState = state.completionState;
        if (completionState is Success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Event created!'),
          ));
          cubit.onSuccessReceived();
          titleController.clear();
          descriptionController.clear();
          eventLinkController.clear();
        } else if (completionState is Fail) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Something go wrong, creating failed!'),
          ));
          cubit.onFailureReceived();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              ITextField(
                labelText: "Title",
                height: 52,
                textController: titleController,
                onChanged: BlocProvider.of<CreateEventCubit>(context).onTitleChanged,
                validator: Validators.requiredValidator,
              ),
              const SizedBox(height: 24),
              ITextField(
                labelText: "Description",
                height: 52,
                textController: descriptionController,
                onChanged: BlocProvider.of<CreateEventCubit>(context).onDescriptionChanged,
                validator: Validators.requiredValidator,
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ITextField(
                      labelText: "Event link",
                      height: 52,
                      textController: eventLinkController,
                      onChanged: BlocProvider.of<CreateEventCubit>(context).onEventLinkChanged,
                      validator: Validators.requiredValidator,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Flexible(
                    child: IOutlinedButton(
                      height: 48,
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: widget.date,
                          firstDate: widget.date,
                          lastDate: widget.date.add(const Duration(days: 90)),
                        );
                        if (selectedDate != null && context.mounted) {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (selectedTime != null && context.mounted) {
                            final newTime = selectedDate.copyWith(hour: selectedTime.hour, minute: selectedTime.minute);
                            BlocProvider.of<CreateEventCubit>(context).onSelectedDateChanged(newTime);
                          }
                        }
                      },
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        DateFormat('E, MMM d, y').format(widget.date),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
