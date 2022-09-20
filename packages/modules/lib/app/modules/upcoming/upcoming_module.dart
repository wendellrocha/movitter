import 'package:flutter_modular/flutter_modular.dart';

import 'upcoming_page.dart';
import 'upcoming_store.dart';

class UpcomingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UpcomingStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const UpcomingPage()),
  ];
}
