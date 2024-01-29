import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../event_tile/event_tile.dart';
import 'bloc/main_cubit.dart';
import 'bloc/main_view_state.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainViewState>(
      builder: (context, state) {
        if (!state.isLoading) {
          final events = state.events..sort((p1, p2) => p1.eventDate.compareTo(p2.eventDate));
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventTile(event); // TODO loading items
            },
          );
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 32),
              Text("Loading events")
            ],
          ),
        );
      },
    );
  }
}
