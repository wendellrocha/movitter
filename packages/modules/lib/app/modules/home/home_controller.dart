import 'home_store.dart';

class HomeController {
  final HomeStore _store;

  HomeController(this._store);

  HomeStore get store => _store;
}
