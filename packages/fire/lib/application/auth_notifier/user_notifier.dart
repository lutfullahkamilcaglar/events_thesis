import 'package:flutter/foundation.dart';

class UserNotifier<T> extends ChangeNotifier {
  T? get user => _user;

  late T? _user;

  UserNotifier();

  void onUserReceived(T? userValue) {
    _user = userValue;
    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }
}
