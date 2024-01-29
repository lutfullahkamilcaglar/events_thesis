/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import '../../data/model/remote_event.dart';

class GetEventDataUseCase {
  final FirebaseFirestore _firestore;
  final Logger _logger;

  const GetEventDataUseCase({
    required Logger logger,
    required FirebaseFirestore firestore,
  }) : _firestore = firestore, _logger = logger;

  Stream<QuerySnapshot<RemoteEvent>> getEventCollectionStream() => _firestore
      .collection("events")
      .withConverter(
        fromFirestore: RemoteEvent.fromFirestore,
        toFirestore: (RemoteEvent event, _) => event.toFirestore(),
      )
      .snapshots();

  Future<List<RemoteAttendant>> getAttendants(String eventId) async {
    final attendantsSnapshots = await _firestore
        .collection("events")
        .doc(eventId)
        .collection("attendants")
        .withConverter(
            fromFirestore: RemoteAttendant.fromFirestore,
            toFirestore: (RemoteAttendant attendant, _) => attendant.toFirestore())
        .get();
    return attendantsSnapshots.docs.map((it) => it.data()).toList();
  }

  Future<RemoteEvent?> getEventData(String eventId) async {
    try {
      final ref = _firestore.collection("events").doc(eventId).withConverter(
        fromFirestore: RemoteEvent.fromFirestore,
        toFirestore: (RemoteEvent event, _) => event.toFirestore(),
      );
      final snapshot = await ref.get();
      return snapshot.data();
    } on Exception catch (exception) {
      _logger.e(exception);
      return null;
    }
  }
}
*/
