import 'package:core/core.dart';
import 'package:navigation/app_router/app_router.dart';

void setupNavigationDependencies() {
  appLocator.registerLazySingleton<AppRouter>(() => AppRouter());
}
