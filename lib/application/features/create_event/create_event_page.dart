import 'package:d_events/application/features/create_event/create_event_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/global_dependencies.dart';
import 'bloc/create_event_cubit.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateEventCubit(lambdaRepository: getIt()),
      child: const CreateEventView(),
    );
  }
}
