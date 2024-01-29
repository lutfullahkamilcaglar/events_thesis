import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import '../../data/model/remote_user.dart';


class GetAuthorizationUserDataUseCase {
  final FirebaseFirestore _firestore;
  final Logger _logger;

  const GetAuthorizationUserDataUseCase({
    required Logger logger,
    required FirebaseFirestore firestore,
  }) : _firestore = firestore, _logger = logger;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDocumentStream(String userUid) {
    return _firestore.collection("userData").doc(userUid).snapshots();
  }

  Future<RemoteUser?> getUserData(String userUid) async {
    try {
      final ref = _firestore.collection("userData").doc(userUid).withConverter(
            fromFirestore: RemoteUser.fromFirestore,
            toFirestore: (RemoteUser user, _) => user.toFirestore(),
          );
      final snapshot = await ref.get();
      return snapshot.data();
    } on Exception catch (exception) {
      _logger.e(exception);
      return null;
    }
  }
}
