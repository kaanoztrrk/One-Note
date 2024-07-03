import 'package:flutter/material.dart';
import 'package:one_note/Util/Theme/theme.dart';
import 'package:one_note/core/routes/routes_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ViAppTheme.ligthTheme,
      routerConfig: router,
    );
  }
}
