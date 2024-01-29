import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_events/domain/model/user.dart';

class RemoteUser {
  final String email;
  final String displayName;
  final bool isActive;
  final bool isAdmin;
  final int platformIndex;
  final String uid;
  final List<RemoteAttendingEvent> attendance;

  const RemoteUser({
    required this.email,
    required this.displayName,
    required this.isActive,
    required this.isAdmin,
    required this.platformIndex,
    required this.uid,
    required this.attendance,
  });

  factory RemoteUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    final List<dynamic> attendanceList = data?['attendance'] ?? <dynamic>[];
    final List<RemoteAttendingEvent> attendance = attendanceList.map((it) {
      final map = it as Map<String, dynamic>;
      return RemoteAttendingEvent.fromMap(map);
    }).toList();

    return RemoteUser(
      email: data?['email'],
      displayName: data?['displayName'],
      isActive: data?['isActive'],
      isAdmin: data?['isAdmin'],
      platformIndex: data?['platformIndex'],
      uid: data?['uid'],
      attendance: attendance,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
      "displayName": displayName,
      "isActive": isActive,
      "isAdmin": isAdmin,
      "platformIndex": platformIndex,
      "uid": uid,
      "attendance": attendance.map((it) => it.toFirestore()).toList(),
    };
  }
}

extension DomainMapperRemoteUser on RemoteUser {
  User toDomain() {
    return User(
      email: email,
      displayName: displayName,
      isActive: isActive,
      isAdmin: isAdmin,
      platformIndex: platformIndex,
      uid: uid,
      attendance: attendance.map((it) => it.toDomain()).toList(),
    );
  }
}

class RemoteAttendingEvent {
  final DateTime eventDate;
  final String eventId;
  final String eventTitle;

  const RemoteAttendingEvent({
    required this.eventDate,
    required this.eventId,
    required this.eventTitle,
  });

  factory RemoteAttendingEvent.fromMap(Map<String, dynamic> data) {
    return RemoteAttendingEvent(
      eventDate: (data['eventDate'] as Timestamp).toDate(),
      eventId: data['eventId'],
      eventTitle: data['eventTitle'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "eventDate": Timestamp.fromDate(eventDate),
      "eventId": eventId,
      "eventTitle": eventTitle,
    };
  }
}

extension DomainMapper on RemoteAttendingEvent {
  AttendingEvent toDomain() {
    return AttendingEvent(
      eventDate: eventDate,
      eventId: eventId,
      eventTitle: eventTitle,
    );
  }
}