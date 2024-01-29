import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

abstract class StorageRepository {
  Stream<TaskSnapshot> uploadFile({required Uint8List file, required String uploadPath});

  Future<String> getDownloadUrl(String path);
}