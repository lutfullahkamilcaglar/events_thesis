import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final String title;
  final String description;
  final DateTime eventDate;
  final String eventLink;
  final String uid;
  final List<Attendant> attendants;

  const Event({
    required this.title,
    required this.description,
    required this.eventDate,
    required this.eventLink,
    required this.uid,
    required this.attendants,
  });

  bool? attendanceOf(String userUid) {
    try {
      final attendant = attendants.firstWhere((it) => it.uid == userUid);
      return attendant.isAttending;
    } on StateError {
      return null;
    }
  }

  int get attendantCount => attendants.where((it) => it.isAttending).toList().length;

  @override
  List<Object> get props => [title, description, eventDate, eventLink, uid, attendants];
}

class Attendant extends Equatable {
  final String name;
  final String uid;
  final bool isAttending;
  final int platformIndex;

  const Attendant({
    required this.name,
    required this.uid,
    required this.isAttending,
    required this.platformIndex,
  });

  @override
  List<Object> get props => [name, uid, isAttending, platformIndex];
}