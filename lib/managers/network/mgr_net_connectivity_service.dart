import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { WiFi, Cellular, Offline }

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStatusController =
  StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(_getStatusFromResult(result));
    });
    Connectivity().checkConnectivity().then((ConnectivityResult result) {
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  static _isConnectedStatus(ConnectivityStatus status) {
    return status != null && status != ConnectivityStatus.Offline;
  }

  static isConnected() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    ConnectivityStatus status = _getStatusFromResult(result);
    return _isConnectedStatus(status);
  }

  static whenConnected(callback) async {
    bool connected = await isConnected();
    if (connected) {
      callback();
    }
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      ConnectivityStatus status = _getStatusFromResult(result);
      if (_isConnectedStatus(status)) {
        callback();
      }
    });
  }

  // Convert from the third part enum to our own enum
  static ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
