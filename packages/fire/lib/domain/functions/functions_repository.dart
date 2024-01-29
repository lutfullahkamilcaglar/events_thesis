import '../model/result.dart';

abstract class FunctionsRepository {

  const FunctionsRepository();

  Future<Result<Map<String, dynamic>>> callFunction({
    required String name,
    Map<String, dynamic>? parameters,
  });

  Future<Result<R>> callFunctionV2<R>({
    required String name,
    Map<String, dynamic>? parameters,
  });
}