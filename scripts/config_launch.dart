import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show joinAll;

import 'utils.dart';

void main(List<String> args) async {
  final launchPath =
      joinAll([Directory.current.path, '.vscode', 'launch.json']);
  final envPath = joinAll([Directory.current.path, '.env']);

  final env = await parseDotEnv(envPath);
  final launch = await _readJsonFile(launchPath);

  final newArgs = <String>[];
  for (var a in launch['configurations'] as List) {
    final args = a['args'] as List;
    for (int i = 0; i < args.length; i++) {
      final String item = args[i];
      if (!item.contains('TMDB_API_KEY')) {
        newArgs.add(item);
      } else {
        newArgs.add(item.replaceAll('{{TMDB_API_KEY}}', env['TMDB_API_KEY']));
      }
    }
  }

  final newMap = Map<String, dynamic>.from(launch);
  for (final config in launch['configurations'] as List) {
    final args = (config['args'] as List);
    for (int j = 0; j < args.length; j++) {
      args[j] = newArgs[j];
    }
  }

  await _writeJsonFile(launchPath, newMap);
}

Future<Map<String, dynamic>> _readJsonFile(String filePath) async {
  final file = File(filePath);

  if (!file.existsSync()) {
    throw Exception('File not exists');
  }

  final map = jsonDecode(file.readAsStringSync());
  return map;
}

Future _writeJsonFile(String path, Map<String, dynamic> json) async {
  File(path).writeAsString(jsonEncode(json).toString());
}
