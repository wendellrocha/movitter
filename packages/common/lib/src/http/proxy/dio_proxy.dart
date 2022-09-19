import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:dio/adapter.dart';

import '../../utils/utils.dart';

class DioProxy {
  final Dio dio;

  DioProxy(this.dio) {
    _checkForProxy(dio);
  }

  Future<void> _checkForProxy(Dio dio) async {
    String proxyIP = '';

    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.address == '192.168.2.106') {
          proxyIP = '192.168.2.106';
          break;
        }

        if (addr.address == '192.168.2.100') {
          proxyIP = '192.168.2.100';
          break;
        }

        /// Android emulator
        if (addr.address.contains('10.0.2')) {
          proxyIP = '10.0.2.2';
          break;
        }

        /// Android emulator
        if (addr.address.contains('192.168.232')) {
          proxyIP = '10.0.2.2';
          break;
        }

        /// WSA
        if (addr.address.startsWith('172')) {
          proxyIP = '192.168.100.85';
          break;
        }
      }
    }

    if (proxyIP.isEmpty) return;
    '#Proxy Enabled, #addr: $proxyIP'.log();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) => 'PROXY $proxyIP:8080;';
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  }
}
