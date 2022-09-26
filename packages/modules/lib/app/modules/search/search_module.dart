import 'package:dependencies/dependencies.dart';

import 'search_page.dart';
import 'search_store.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => SearchStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SearchPage()),
  ];
}
