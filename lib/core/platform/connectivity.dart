import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:rxdart/rxdart.dart';

class ConnectivityService {
  ///Connection status controller....
  BehaviorSubject<ConnectionStatus> connectivityController = BehaviorSubject();
  ConnectionStatus connectionStatus = ConnectionStatus.offline;

  ///Fetch the Connection Status...
  ConnectivityService() {
    InternetConnection().onStatusChange.listen((event) {
      connectionStatus = _networkStatus(event);

      ///Emit the status via Stream...
      connectivityController.add(connectionStatus);
    });
  }

  //Converts the connectivity result into our enums
  //Currently the output id mobile, wifi,none.....
  ConnectionStatus _networkStatus(InternetStatus status) {
    switch (status) {
      case InternetStatus.connected:
        return ConnectionStatus.online;

      case InternetStatus.disconnected:
        return ConnectionStatus.offline;

      default:
        return ConnectionStatus.offline;
    }
  }
}

enum ConnectionStatus {
  online,
  offline,
}
