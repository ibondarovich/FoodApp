import 'package:core/core.dart';

class NetworkInfo {
  final Connectivity connectivity;
  NetworkInfo({
    required this.connectivity,
  });

  Future<bool> get isConnected async {
    final ConnectivityResult result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }
}
