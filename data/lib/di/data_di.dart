import 'package:core/config/app_config.dart';
import 'package:core/config/network/dio_config.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';

import '../errors/error_handler.dart';
import '../providers/api_provider.dart';
import '../providers/socket_provider.dart';
import '../repositories/socket_repository_impl.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    //SocketProvider().getSocketServer();
    //SocketProvider().getSocketClient();

    _initDio();
    _initApi();
    _initServerpod();
    _initRepository();
  }

  void _initServerpod() {
    appLocator.registerSingleton<SocketProvider>(
      SocketProvider(),
    );
  }

  void _initDio() {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );
  }

  void _initApi() {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );

    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        appLocator<DioConfig>().dio,
      ),
    );
  }

  void _initRepository() {
    appLocator.registerSingleton<SocketRepository>(
      SocketRepositoryImpl(
        socketProvider: appLocator.get<SocketProvider>(),
      ),
    );
  }
}
