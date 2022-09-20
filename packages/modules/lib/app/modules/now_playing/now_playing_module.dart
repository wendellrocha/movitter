import 'package:flutter_modular/flutter_modular.dart';

import 'now_playing_page.dart';
import 'now_playing_store.dart';

class NowPlayingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NowPlayingStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NowPlayingPage()),
  ];
}
