// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String displayName;
  final bool isActive;
  final bool isAdmin;
  final int platformIndex;
  final String uid;
  final List<AttendingEvent> attendance;

  const User({
    required this.email,
    required this.displayName,
    required this.isActive,
    required this.isAdmin,
    required this.platformIndex,
    required this.uid,
    required this.attendance,
  });

  @override
  List<Object> get props => [email, isActive, isAdmin, platformIndex, uid, attendance, displayName];
}

class AttendingEvent extends Equatable {
  final DateTime eventDate;
  final String eventId;
  final String eventTitle;

  const AttendingEvent({
    required this.eventDate,
    required this.eventId,
    required this.eventTitle,
  });

  @override
  List<Object> get props => [eventDate, eventId, eventTitle];
}
