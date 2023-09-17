import 'package:flutter/material.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:switcher_comunicaciones/server_src/ip_info.dart';
import 'package:switcher_comunicaciones/server_src/router.dart';
import 'package:switcher_comunicaciones/src/App/view_models/live_streaming_view_model.dart';
import 'package:switcher_comunicaciones/src/App/view_models/welcome_screen_view_model.dart';
import 'package:switcher_comunicaciones/src/routes.dart';
import 'package:wifi_ip_details/wifi_ip_details.dart';

class LiveStreamingScreen extends StatefulWidget {
  const LiveStreamingScreen({super.key});

  @override
  State<LiveStreamingScreen> createState() => _LiveStreamingScreenState();
}

class _LiveStreamingScreenState extends State<LiveStreamingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<WelcomeScreenViewModel, LiveStreamingViewModel>(
        builder: (context, viewModel, liveStrViewModel, snapshot) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              context.go(Routes.root);
            },
          ),
          title: Text("Live Streaming"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Text(
                    "Pídele a los Camarógrafos que se conecten a esta dirección IP: "),
                SelectableText("${viewModel.toConnectIp}")
              ],
            ),
            ElevatedButton(
              onPressed: () =>
                  liveStrViewModel.copyToClipboard("${viewModel.toConnectIp}"),
              child: Text("Copiar IP"),
            ),
          ],
        ),
      );
    });
  }
}
