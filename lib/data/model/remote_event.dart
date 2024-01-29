import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_events/domain/model/event.dart';

class RemoteEvent {
  final String title;
  final String description;
  final DateTime eventDate;
  final String eventLink;
  final String uid;
  final List<RemoteAttendant> attendants;

  const RemoteEvent({
    required this.title,
    required this.description,
    required this.eventDate,
    required this.eventLink,
    required this.uid,
    required this.attendants,
  });

  factory RemoteEvent.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    final List<dynamic> attendantsList = data?['attendants'] ?? <dynamic>[];
    final List<RemoteAttendant> attendants = attendantsList.map((it) {
      final map = it as Map<String, dynamic>;
      return RemoteAttendant.fromMap(map);
    }).toList();

    return RemoteEvent(
      title: data?['title'],
      description: data?['description'],
      eventDate: (data?['eventDate'] as Timestamp).toDate(),
      eventLink: data?['eventLink'],
      uid: snapshot.id,
      attendants: attendants,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "description": description,
      "eventDate": Timestamp.fromDate(eventDate),
      "eventLink": eventLink,
      "attendants": attendants.map((it) => it.toFirestore()).toList(),
    };
  }
}

extension DomainMapperRemoteEvent on RemoteEvent {
  Event toDomain() {
    return Event(
        title: title,
        description: description,
        eventDate: eventDate,
        eventLink: eventLink,
        uid: uid,
        attendants: attendants.map((it) => it.toDomain()).toList(),
    );
  }
}

class RemoteAttendant {
  final String name;
  final String uid;
  final bool isAttending;
  final int platformIndex;

  const RemoteAttendant({
    required this.name,
    required this.uid,
    required this.isAttending,
    required this.platformIndex,
  });

  factory RemoteAttendant.fromMap(Map<String, dynamic> data) {
    return RemoteAttendant(
      name: data['username'],
      uid: data['uid'],
      isAttending: data['isAttending'],
      platformIndex: data['platformIndex'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "uid": uid,
      "isAttending": isAttending,
      "platformIndex": platformIndex,
    };
  }
}

extension DomainMapper on RemoteAttendant {
  Attendant toDomain() {
    return Attendant(name: name, uid: uid, isAttending: isAttending, platformIndex: platformIndex);
  }
}