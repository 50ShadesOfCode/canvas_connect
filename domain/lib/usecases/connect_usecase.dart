import '../domain.dart';
import 'usecase.dart';

class ConnectUseCase extends UseCase<NoParams, void> {
  final SocketRepository socketRepository;

  ConnectUseCase({
    required this.socketRepository,
  });

  @override
  void execute(NoParams input) {
    socketRepository.connect();
  }
}
