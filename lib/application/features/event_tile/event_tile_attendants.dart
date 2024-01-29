import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../domain/model/event.dart';
import '../../../domain/static/platforms.dart';

class EventTileAttendants extends StatelessWidget {
  final List<Attendant> attendants;
  const EventTileAttendants({Key? key, required this.attendants}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final attending = attendants.where((it) => it.isAttending).toList();
    final notAttending = attendants.where((it) => !it.isAttending).toList();
    return Material(
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    "Participants",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                       fontSize: 20,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: attending.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = attending[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Text(Platforms[item.platformIndex] ?? ""),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    "Non-participants",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: notAttending.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = notAttending[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Text(Platforms[item.platformIndex] ?? ""),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
