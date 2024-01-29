import 'package:design/animation/container_transition_builder.dart';
import 'package:flutter/material.dart';
import '../../../domain/model/event.dart';
import 'event_details.dart';
import 'event_tile_shrinked.dart';

class EventTile extends StatelessWidget {
  final Event event;

  const EventTile(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerTransitionBuilder(
      child1: (dynamic Function() openContainer) {
        return EventTileShrink(
          event: event,
          onClick: openContainer,
        );
      },
      child2: EventDetails(event.uid),
    );
  }
}
