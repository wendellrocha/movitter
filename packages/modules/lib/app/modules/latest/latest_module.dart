import 'package:flutter_modular/flutter_modular.dart';

import 'latest_page.dart';
import 'latest_store.dart';

class LatestModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LatestStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LatestPage()),
  ];
}
