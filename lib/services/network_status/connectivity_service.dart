import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

enum ConnectivityStatus { WiFi, Cellular, Offline }

@singleton
class ConnectivityService {
  final BehaviorSubject<ConnectivityStatus> _connectionStatusController =
      BehaviorSubject<ConnectivityStatus>();
  ConnectivityStatus get currentConnectionStatus =>
      _connectionStatusController.value;
  Stream<ConnectivityStatus> get connectionStatusStream =>
      _connectionStatusController.stream;

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      ConnectivityStatus newStatus = _getStatusFromResult(result);
      if (_connectionStatusController.value != newStatus)
        _connectionStatusController.add(newStatus);
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
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
