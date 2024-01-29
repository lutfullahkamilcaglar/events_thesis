import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/storage/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {

  final Reference _storage = FirebaseStorage.instance.ref();

  StorageRepositoryImpl();

  @override
  Stream<TaskSnapshot> uploadFile({required Uint8List file, required String uploadPath}) {
    final uploadTask = _storage.child(uploadPath).putData(file);
    return uploadTask.snapshotEvents;
  }

  @override
  Future<String> getDownloadUrl(String path) async {
    return await _storage.child(path).getDownloadURL();
  }

}
