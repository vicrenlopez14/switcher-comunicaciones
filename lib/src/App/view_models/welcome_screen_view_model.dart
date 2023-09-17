import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:switcher_comunicaciones/server_src/router.dart';
import 'package:switcher_comunicaciones/src/router.dart';
import 'package:switcher_comunicaciones/src/routes.dart';

class WelcomeScreenViewModel extends ChangeNotifier {
  String toConnectIp = "";
  String IpV4Address = "";
  NetworkInterface? selectedInterface;

  Future<List<NetworkInterface>> get networkInterfaces async =>
      await NetworkInterface.list();

  void selectInterface(NetworkInterface interface) {
    selectedInterface = interface;

    IpV4Address = selectedInterface!.addresses
        .where((element) => element.type == InternetAddressType.IPv4)
        .first
        .address
        .toString();

    toConnectIp = 'ws://${IpV4Address}:${8080}/ws';
    notifyListeners();
  }

  startServer() async {
    if (selectedInterface == null) {
      showAdaptiveDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Seleccione una interfaz de red"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Aceptar"),
            )
          ],
        ),
      );
      return;
    }

    // If selected interface doenst have an address, show error
    if (selectedInterface!.addresses.isEmpty) {
      showAdaptiveDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("La interfaz seleccionada no tiene una dirección IP"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Aceptar"),
            )
          ],
        ),
      );
      return;
    }

    routerStart(IpV4Address, 8080);
    navigatorKey.currentContext!.go(Routes.liveStreaming);
    notifyListeners();
  }
}
