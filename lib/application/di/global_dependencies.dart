import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_events/application/routes/admin_guard.dart';
import 'package:d_events/data/firestore_repository.dart';
import 'package:d_events/data/lambda_repository.dart';
import 'package:design/notifiers/theme_notifier.dart';
import 'package:fire/application/auth_cubit/auth_cubit.dart';
import 'package:fire/application/auth_notifier/auth_notifier.dart';
import 'package:fire/application/auth_notifier/user_notifier.dart';
import 'package:fire/application/global_auth_observable/global_auth_observable.dart';
import 'package:fire/data/auth/auth_repository_impl.dart';
import 'package:fire/data/functions/functions_repository_impl.dart';
import 'package:fire/domain/auth/auth_repository.dart';
import 'package:fire/domain/functions/functions_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import '../../domain/model/user.dart';
import '../../domain/usecase/get_authorization_user_data_use_case.dart';
import '../routes/app_router.dart';
import '../routes/auth_guard.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  setupSingleton();
  setupFactories();
}

void setupSingleton() {
  // ChangeNotifiers / Observables
  getIt.registerSingleton(AuthNotifier());
  getIt.registerSingleton(UserNotifier<User>());
  getIt.registerSingleton(ThemeNotifier());

  //
  getIt.registerSingleton(Logger());
  getIt.registerSingleton(const Uuid());
  getIt.registerSingleton(GlobalAuthObservable());
  getIt.registerSingleton(AppRouter(authGuard: AuthGuard(), adminGuard: AdminGuard()));
}

void setupFactories() {
  getIt.registerFactory<AuthRepository>(() => AuthRepositoryImpl(getIt()));
  getIt.registerFactory<FunctionsRepository>(() => FunctionsRepositoryImpl(logger: getIt()));

  getIt.registerFactory(() => AuthCubit(getIt<AuthRepository>()));  // remove from here -> move to required part under bloc provider

  getIt.registerFactory<FireStoreRepository>(() => FireStoreRepository(
        firestore: FirebaseFirestore.instance,
        logger: getIt(),
      ));
  getIt.registerFactory<LambdaRepository>(() => LambdaRepository(
    repository: getIt(),
  ));


/*

  getIt.registerFactory<FunctionsRepository>(() => FunctionsRepositoryImpl(logger: getIt()));

  getIt.registerFactory(() => GetRecognitionUseCase(
        functionsRepository: getIt(),
        logger: getIt(),
      ));
*/

  getIt.registerFactory(() => GetAuthorizationUserDataUseCase(
      logger: getIt(),
      firestore: FirebaseFirestore.instance,
  ));
/*  getIt.registerFactory(() => GetEventDataUseCase(
    logger: getIt(),
    firestore: FirebaseFirestore.instance,
  ));*/
}
