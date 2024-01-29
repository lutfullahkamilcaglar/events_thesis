import 'package:cloud_functions/cloud_functions.dart';
import 'package:logger/logger.dart';

import '../../domain/functions/functions_repository.dart';
import '../../domain/model/result.dart';

class FunctionsRepositoryImpl extends FunctionsRepository {

  final _functions = FirebaseFunctions.instance;
  final Logger _logger;

  FunctionsRepositoryImpl({required Logger logger}): _logger = logger;

  @override
  Future<Result<R>> callFunctionV2<R>({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    //_functions.useFunctionsEmulator("localhost", 5001);
    try {
      HttpsCallable callable = _getCallable(name);
      final HttpsCallableResult<R> res = await callable.call(parameters);
      final data = _castOrNull<R>(res.data);
      if (data != null) {
        return Result.success(data: data);
      } else {
        _logger.e("null data ${res.toString()}");
        return const Result.error();
      }
    } on FirebaseFunctionsException catch (e) {
      _logger.e(e);
      return const Result.error();
    } catch (error) {
      _logger.e(error);
      return const Result.error();
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> callFunction({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    //_functions.useFunctionsEmulator("localhost", 5001);
    try {
      HttpsCallable callable = _getCallable(name);
      final HttpsCallableResult<Map<String, dynamic>> res = await callable.call(parameters);
      final data = _castOrNull<Map<String, dynamic>>(res.data);
      if (data != null) {
        return Result.success(data: data);
      } else {
        _logger.e("null data ${res.toString()}");
        return const Result.error();
      }
    } on FirebaseFunctionsException catch(e) {
      _logger.e(e);
      return const Result.error();
    } catch (error) {
      _logger.e(error);
      return const Result.error();
    }
  }

  HttpsCallable _getCallable(String name) => _functions.httpsCallable(name);

  R? _castOrNull<R>(dynamic it) => it is R ? it : null;
}
