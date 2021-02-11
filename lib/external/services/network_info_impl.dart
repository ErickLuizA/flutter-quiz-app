import 'package:Queszz/infra/services/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
