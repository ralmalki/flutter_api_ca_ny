////////////////////////////////////////////////////////////////////////
///
///Code Source: https://github.dev/ResoCoder/flutter-tdd-clean-architecture-course
///
////////////////////////////////////////////////////////////////////////

import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
