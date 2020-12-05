import 'dart:async';

import 'package:ProjectTemplate/core/base/i_output.dart';
import 'package:ProjectTemplate/injection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ProjectTemplate/services/network_status/connectivity_service.dart';
import 'i_input.dart';

class BaseViewModel {
  final ConnectivityService _connectivityService = getIt<ConnectivityService>();
  StreamSubscription _connectSubscription;

  final IInput input = BaseInput();
  final IOutput output = BaseOutput();

  BaseViewModel() {
    transform();
  }

  void transform() {
    if (_connectSubscription != null) _connectSubscription.cancel();
    _connectSubscription =
        _connectivityService.connectionStatusStream.listen((status) {
      if (status == ConnectivityStatus.Offline) {
        output.offline.add(true);
      } else {
        output.offline.add(false);
      }
    });
  }

  void dispose() {
    _connectSubscription.cancel();
    input.dispose();
    output.dispose();
  }
}

class BaseInput implements IInput {
  void dispose() {}
}

class BaseOutput implements IOutput {
  @override
  PublishSubject<String> alert = PublishSubject<String>();
  @override
  PublishSubject<bool> loading = PublishSubject<bool>();
  @override
  PublishSubject<bool> offline = PublishSubject<bool>();

  @override
  void dispose() {
    alert.close();
    loading.close();
    offline.close();
  }
}
