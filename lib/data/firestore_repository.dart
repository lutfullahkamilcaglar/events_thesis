import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_events/domain/model/event.dart';
import 'package:d_events/domain/model/user.dart';
import 'package:logger/logger.dart';

import 'model/remote_event.dart';
import 'model/remote_user.dart';

class FireStoreRepository {
  final FirebaseFirestore _firestore;
  final Logger _logger;

  FireStoreRepository({
    required FirebaseFirestore firestore,
    required Logger logger,
  }) : _firestore = firestore, _logger = logger;
  
  // Event
  
  Stream<List<Event>> getEventCollectionStream() => _firestore
      .collection("events")
      .withConverter(
        fromFirestore: RemoteEvent.fromFirestore,
        toFirestore: (RemoteEvent event, _) => event.toFirestore(),
      )
      .snapshots()
      .asyncMap(_handleRemoteEventQuerySnapShot);

  List<Event> _handleRemoteEventQuerySnapShot(QuerySnapshot<RemoteEvent> event) {
    return event.docs.map((it) => it.data().toDomain()).toList();
  }

  // User
  Stream<User?> getUserDataStream(String userUid) => _firestore
      .collection("userData")
      .doc(userUid)
      .withConverter(
        fromFirestore: RemoteUser.fromFirestore,
        toFirestore: (RemoteUser user, _) => user.toFirestore(),
      )
      .snapshots()
      .asyncMap((it) => it.data()?.toDomain());
}