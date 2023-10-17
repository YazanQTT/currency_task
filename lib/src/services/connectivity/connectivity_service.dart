import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../src.export.dart';

abstract class ConnectivityService {
  void updateConnectionStatus(ConnectivityResult event);
}

@Singleton(as: ConnectivityService)
class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  bool hasConnection = true;

  ConnectivityServiceImpl() {
    init();
  }

  void init() {
    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @override
  void updateConnectionStatus(ConnectivityResult event) {
    if (event == ConnectivityResult.none) {
      showErrorSnackBar('No internet connection.', duration: const Duration(days: 1));
      hasConnection = false;
    } else {
      if(!hasConnection)
        showSuccessSnackBar('Connection is back!');
      hasConnection = true;
    }
  }
}
