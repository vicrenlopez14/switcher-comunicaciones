import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:switcher_comunicaciones/src/App/view_models/welcome_screen_view_model.dart';
import 'package:switcher_comunicaciones/src/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WelcomeScreenViewModel>(
          builder: (context, viewModel, snapshot) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Seleccione una interfaz de red"),
              Text(
                  "Esta será la red que se usará para desplegar la transmisión"),
              SizedBox(height: 24),
              FutureBuilder<List<NetworkInterface>>(
                future: viewModel.networkInterfaces,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton<int>(
                      value: viewModel.selectedInterface?.index ??
                          snapshot.data!.first.index,
                      onChanged: (value) => viewModel.selectInterface(snapshot
                          .data!
                          .where((element) => element.index == value)
                          .first),
                      items: snapshot.data!
                          .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e.index,
                              ))
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error");
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => viewModel.startServer(),
                child: Text("Iniciar transmisión"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
