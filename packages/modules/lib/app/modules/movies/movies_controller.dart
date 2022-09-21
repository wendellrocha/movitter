import 'package:dependencies/dependencies.dart';

class MoviesController implements Disposable {
  final _currentIndex = RxNotifier<int>(0);
  int get currentIndex => _currentIndex.value;
  setIndex(int index) => _currentIndex.value = index;

  @override
  void dispose() {
    _currentIndex.dispose();
  }
}
