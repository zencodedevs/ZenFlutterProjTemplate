import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// A simplified [Connectivity] interface.
class ConnectivityUtils {
  static final connectivity = Connectivity();

  /// Checks connection from the [connectivity], and matches all the [ConnectivityResult]
  /// values to return simple boolean about status.
  static Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result.hasConnection;
  }

  /// Main stream controller, that we use to listen user changes.
  final StreamController<bool> controller = StreamController<bool>.broadcast();

  /// A shortcut getter for [controller]'s stream.
  Stream<bool> get stream => controller.stream;

  /// Starts listening to connectivity changes and returns a instance of stream
  /// subscription that you have to point/append to variable, in order to cancel later.
  ///
  /// [onChanged] is a paralel alternative to [controller]'s event adding.
  Future<StreamSubscription<ConnectivityResult>> listenConnectivity({
    void Function(bool)? onChanged,
  }) async {
    return connectivity.onConnectivityChanged.listen(
      (event) {
        final status = event.hasConnection;
        controller.add(status);
        onChanged?.call(status);
      },
    );
  }
}

extension ConnectivityResultExt on ConnectivityResult {
  /// Converts [ConnectivityResult] to a simple boolean
  /// indicator about connectivity status.
  bool get hasConnection {
    switch (this) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.vpn:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.other:
      case ConnectivityResult.mobile:
      case ConnectivityResult.bluetooth:
        return true;
      case ConnectivityResult.none:
        return false;
    }
  }
}
