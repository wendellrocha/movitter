import 'package:flutter_modular/flutter_modular.dart';

import 'top_rated_page.dart';
import 'top_rated_store.dart';

class TopRatedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TopRatedStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TopRatedPage()),
  ];
}
