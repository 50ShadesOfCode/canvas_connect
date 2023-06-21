import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';

import '../providers/socket_provider.dart';
import '../repositories/socket_repository_impl.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initServerpod();
    _initRepository();
    _initUsecase();
  }

  void _initServerpod() {
    appLocator.registerSingleton<SocketProvider>(
      SocketProvider(),
    );
  }

  void _initRepository() {
    appLocator.registerSingleton<SocketRepository>(
      SocketRepositoryImpl(
        socketProvider: appLocator.get<SocketProvider>(),
      ),
    );
  }

  void _initUsecase() {
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
