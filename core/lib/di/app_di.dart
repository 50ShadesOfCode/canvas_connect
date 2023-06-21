import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/app_router/app_router.dart';

import '../config/firebase_options.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

const String unauthScope = 'unauthScope';
const String authScope = 'authScope';

class AppDI {
  static void initDependencies() {
    appLocator.registerSingleton<FirebaseOptions>(
      DefaultFirebaseOptions.currentPlatform,
    );
    appLocator.registerSingleton<AppRouter>(
      AppRouter(),
    );
  }
}
