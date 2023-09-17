import 'dart:io';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_plus/shelf_plus.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';

String channelIp = "";

void routerStart(String address, int port) async {
  var handler = webSocketHandler((webSocket) {
    webSocket.stream.listen((message) {
      webSocket.sink.add('Echo: $message');
      print(message);
    });
  });

  shelf_io.serve(handler, address, port).then((server) {
    print('Serving at ws://${server.address.host}:${server.port}');
  });
}
