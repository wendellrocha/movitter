// ignore_for_file: avoid_print

import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show joinAll;

void main(List<String> args) {
  final envPath = joinAll([Directory.current.path, '.env']);
  if (Platform.isWindows) {
    final scriptPath = joinAll(
      [Directory.current.path, 'scripts', 'script.ps1'],
    );
    _printResult(Process.runSync(scriptPath, [envPath]));
  } else {
    final scriptPath = joinAll(
      [Directory.current.path, 'scripts', 'script.sh'],
    );
    _printResult(Process.runSync(scriptPath, [envPath]));
  }
}

void _printResult(ProcessResult result) {
  if ((result.stderr as String).isNotEmpty) {
    print('stdrr: ${result.stderr}');
  }

  if ((result.stdout as String).isNotEmpty) {
    print('stdout: ${result.stdout}');
  }
}
