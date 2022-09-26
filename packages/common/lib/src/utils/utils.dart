import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';

class Utils {
  static EdgeInsets get gridPadding => const EdgeInsets.all(5);

  static SliverGridDelegateWithFixedCrossAxisCount get gridDelegate {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: (9 / 16) * 0.95,
    );
  }
}

extension Log on Object {
  void log() => devtools.log(toString());
}

extension Capitalize on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
