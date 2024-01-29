import 'package:firebase_storage/firebase_storage.dart';

import '../../application/storage_cubit/storage_state.dart';


extension TaskSnapshotExtensions on Stream<TaskSnapshot> {
  void listenStreamUpdatesWith(StorageViewStateObservable observable) {
    listen(
      (event) {
        switch (event.state) {
          case TaskState.running:
            observable.onRunning();
            break;
          case TaskState.success:
            observable.onSuccess();
            break;
          case TaskState.canceled:
            print("cancel uploading");
            observable.onCancelled();
            break;
          case TaskState.error:
            print("error uploading");
            observable.onError();
            break;
          case TaskState.paused:
            print("paused uploading");
            observable.onPaused();
            break;
        }
      },
      onError: (error) {
        print(error.toString());
        observable.onError();
      },
      cancelOnError: true,
    );
  }
}
