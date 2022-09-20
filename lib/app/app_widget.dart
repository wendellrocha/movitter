import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'theme/theme_light.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movitter',
      theme: LightTheme().themeData,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
