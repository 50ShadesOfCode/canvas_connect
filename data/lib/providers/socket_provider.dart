import 'package:canvas_connect_client/canvas_connect_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class SocketProvider {
  late final Client client;

  SocketProvider()
      : client = Client('http://192.168.135.236:8080/')
          ..connectivityMonitor = FlutterConnectivityMonitor();

  Future<void> sendMessage(Message msg) async {
    await client.canvasConnect.sendStreamMessage(msg);
  }
}
