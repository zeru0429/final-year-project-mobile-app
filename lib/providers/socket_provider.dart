import 'package:flutter/material.dart';
import 'package:mobile/config/server_instance.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

//enuem for conetion
enum SocketStatus { connecting, connected, disconnected, error }

enum SocketEvents {
  CONNECT,
  DISCONNECT,
  JOIN_CHAT,
  LEAVE_CHAT,
  SEND_MESSAGE,
  RECEIVE_MESSAGE,
  UPDATE_GROUP,
  NEW_CHAT,
  TYPING,
  STOPE,
  _TYPING,
}

extension SocketEventsExtension on SocketEvents {
  String get value {
    switch (this) {
      case SocketEvents.CONNECT:
        return 'connect';
      case SocketEvents.DISCONNECT:
        return 'disconnect';
      case SocketEvents.JOIN_CHAT:
        return 'join_chat';
      case SocketEvents.LEAVE_CHAT:
        return 'leave_chat';
      case SocketEvents.SEND_MESSAGE:
        return 'send_message';
      case SocketEvents.RECEIVE_MESSAGE:
        return 'receive_message';
      case SocketEvents.UPDATE_GROUP:
        return 'update_group';
      case SocketEvents.NEW_CHAT:
        return 'new_chat';
      case SocketEvents.TYPING:
        return 'typing';
      case SocketEvents.STOPE:
        return 'stope';
      case SocketEvents._TYPING:
        return '_typing';
      default:
        throw Exception('Unknown SocketEvent: $this');
    }
  }
}

class SocketProvider extends ChangeNotifier {
  IO.Socket? _socket;
  SocketStatus _status = SocketStatus.disconnected;

  //get
  SocketStatus get getStatus => _status;
  //set
  void connect(String token) {
    print("-------------socket started ----------------------");
    _socket = IO.io(ServerInstance.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'Authorization': {'token': token}
    });
    _socket!.connect();

    _socket!.onConnect((_) {
      _status = SocketStatus.connected;
      notifyListeners();
    });
    _socket!.onDisconnect((_) {
      _status = SocketStatus.disconnected;
      notifyListeners();
    });
    _socket!.onError((_) {
      _status = SocketStatus.error;
      notifyListeners();
    });
    //------------ socket events ---------------------//
    _socket!.on(
        SocketEventsExtension(SocketEvents.CONNECT).value,
        (data) => {
              print("-------------socket connected ----------------------"),
              print(data),
              _status = SocketStatus.connected,
              notifyListeners(),
            });

    _socket!.on(
        SocketEventsExtension(SocketEvents.DISCONNECT).value,
        (data) => {
              print("-------------socket disconnected ----------------------"),
              print(data),
              _status = SocketStatus.disconnected,
              notifyListeners(),
            });
    //-----------X- socket events -------------X-------//
  }

  void disconnect() {
    _socket!.disconnect();
    _status = SocketStatus.disconnected;
    notifyListeners();
  }
}
