import 'package:domain/domain.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/app_router/app_router.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

const String unauthScope = 'unauthScope';
const String authScope = 'authScope';

class AppDI {
  static void initDependencies() {
    appLocator.registerSingleton<AppRouter>(
      AppRouter(),
    );
    appLocator.registerFactory<ListenForMessagesStreamUseCase>(
      () => ListenForMessagesStreamUseCase(
        socketRepository: appLocator<SocketRepository>(),
      ),
    );
    appLocator.registerFactory<SendMessageUseCase>(
      () => SendMessageUseCase(
        socketRepository: appLocator<SocketRepository>(),
      ),
    );
    appLocator.registerFactory<ConnectUseCase>(
      () => ConnectUseCase(
        socketRepository: appLocator<SocketRepository>(),
      ),
    );
  }
}
