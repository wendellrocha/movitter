import 'dart:developer' as devtools show log;

class Utils {}

extension Log on Object {
  void log() => devtools.log(toString());
}

extension Capitalize on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
