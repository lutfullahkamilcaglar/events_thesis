import 'package:d_events/application/features/create_event/bloc/create_event_cubit.dart';
import 'package:d_events/application/features/create_event/components/event_form.dart';
import 'package:d_events/application/util/extensions.dart';
import 'package:design/buttons/i_loadable_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_bar.dart';
import '../../resource/theme_color.dart';
import 'bloc/create_event_view_state.dart';

class CreateEventView extends StatefulWidget {
  const CreateEventView({Key? key}) : super(key: key);

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: SingleChildScrollView(
            child: BlocBuilder<CreateEventCubit, CreateEventViewState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Create event",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 32),
                    EventForm(formKey: formKey, date: state.date),
                    const SizedBox(height: 36),
                    ILoadableElevatedButton(
                      isLoading: state.isLoading,
                      onPressed: () => formKey.tryAction(
                      ifValid: () => BlocProvider.of<CreateEventCubit>(context).onSubmit(),
                      ifNotValid: () {},
                    ),
                    backgroundColor: ThemeColor.DarkPetrol,
                      foregroundColor: Colors.white,
                      height: 48,
                      childText: "Create",
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
