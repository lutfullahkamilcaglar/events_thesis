import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/model/event.dart';

class EventTileShrink extends StatelessWidget {
  final Event event;
  final Function() onClick;

  const EventTileShrink({
    Key? key,
    required this.event,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            event.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: DateFormat('MMM').format(event.eventDate),
                  children: [
                    TextSpan(
                      text: DateFormat('\ndd').format(event.eventDate),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onTap: onClick,
        ),
      ),
    );
  }
}
