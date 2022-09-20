import 'package:flutter_modular/flutter_modular.dart';

import 'trending_page.dart';
import 'trending_store.dart';

class TrendingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TrendingStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TrendingPage()),
  ];
}
