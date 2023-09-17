import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switcher_comunicaciones/src/App/view/theme/light_theme.dart';
import 'package:switcher_comunicaciones/src/App/view/theme/scroll_behavior.dart';
import 'package:switcher_comunicaciones/src/providers.dart';
import 'package:switcher_comunicaciones/src/router.dart';

class SwitcherCCApp extends StatefulWidget {
  const SwitcherCCApp({super.key});

  @override
  State<SwitcherCCApp> createState() => _SwitcherCCAppState();
}

class _SwitcherCCAppState extends State<SwitcherCCApp> {
  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp.router(
        title: "Panel de Control - Comunicaciones",
        scrollBehavior: const ScrollBehaviorModified(),
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: routerConfig,
      ),
    );
  }
}
