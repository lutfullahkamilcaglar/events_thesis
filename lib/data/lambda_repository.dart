import 'package:fire/domain/functions/functions_repository.dart';

import '../domain/model/event.dart';
import 'model/waiting_user.dart';

class LambdaRepository {
  final FunctionsRepository _repository;

  LambdaRepository({
    required FunctionsRepository repository,
  }) : _repository = repository;

  Future<bool> attend(Event event, String userName, int platformIndex) async {
    final res = await _repository.callFunctionV2<bool>(
      name: "attendEvent",
      parameters: {
        "eventId": event.uid,
        "userName": userName,
        "eventDate": event.eventDate.toIso8601String(),
        "eventTitle": event.title,
        "platformIndex": platformIndex,
      },
    );
    return res.when(
      success: (_) => true,
      error: (_) => false,
    );
  }

  Future<bool> cancelAttendance(Event event, String userName, int platformIndex) async {
    final res = await _repository.callFunctionV2<bool>(
      name: "cancelAttendance",
      parameters: {
        "eventId": event.uid,
        "userName": userName,
        "eventDate": event.eventDate.toIso8601String(),
        "eventTitle": event.title,
        "platformIndex": platformIndex,
      },
    );
    return res.when(
      success: (_) => true,
      error: (_) => false,
    );
  }

  Future<bool> createEvent({
    required String title,
    required String description,
    required String eventLink,
    required DateTime eventDate,
  }) async {
    final res = await _repository.callFunctionV2<bool>(
      name: "createEvent",
      parameters: {
        "title": title,
        "description": description,
        "eventLink": eventLink,
        "eventDate": eventDate.toIso8601String(),
      },
    );
    return res.when(
      success: (_) => true,
      error: (_) => false,
    );
  }

  Future<dynamic> getUserWaitList() async {
    final res = await _repository.callFunctionV2<List<dynamic>>(name: "getUsersWaitList");
    return res.when(
      success: (data) {
        return (data as List<dynamic>).map((it) {
          final json = it as Map<String, dynamic>;
          return WaitingUser.fromJson(json);
        }).toList();
      },
      error: (_) => false,
    );
  }

  Future<bool> setUserApproval(String userUid, bool approval) async {
    final res = await _repository.callFunctionV2<bool>(
      name: "setUserApproval",
      parameters: {
        "userUid": userUid,
        "approval": approval,
      },
    );
    return res.when(
      success: (_) => true,
      error: (_) => false,
    );
  }

  Future<bool> updateUserData(String userUid, String displayName, int platformIndex) async {
    final res = await _repository.callFunctionV2<bool>(
      name: "updateUserData",
      parameters: {
        "displayName": displayName,
        "platformIndex": platformIndex,
      },
    );
    return res.when(
      success: (_) => true,
      error: (_) => false,
    );
  }
}
