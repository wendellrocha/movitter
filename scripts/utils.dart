import 'dart:io';

Future<Map<String, dynamic>> parseDotEnv(String path) async {
  final file = File(path);

  if (!file.existsSync()) {
    throw Exception('File not exists');
  }
  final env = <String, dynamic>{};
  for (String line in file.readAsLinesSync()) {
    env[line.split('=').first] = line.split('=').last;
  }

  return env;
}
