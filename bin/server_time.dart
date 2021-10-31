import 'dart:convert';

import 'package:web_socket_channel/io.dart';

import 'package:web_socket_channel/status.dart' as status;

// void main(List<String> arguments) {
//   final channel = IOWebSocketChannel.connect(
//       'wss://ws.binaryws.com/websockets/v3?app_id=1089');

//   channel.stream.listen((message) {
//     final decodedMessage = jsonDecode(message);
//     final serverTimeAsEpoch = decodedMessage['time'];
//     final serverTime =
//         DateTime.fromMillisecondsSinceEpoch(serverTimeAsEpoch * 1000);
//     print(serverTime);
//     channel.sink.close();
//   });

//   channel.sink.add('{"time":1}');
// }

// void main(List<String> arguments) {
//   final channel = IOWebSocketChannel.connect(
//       'wss://ws.binaryws.com/websockets/v3?app_id=1089');

//   channel.stream.listen((message) {
//     final decodedMessage = jsonDecode(message);
//     final activeSymbol = decodedMessage['active_symbols'];
//     print(activeSymbol);
//     channel.sink.close();
//   });

//   channel.sink.add('{"active_symbols": "brief", "product_type": "basic"}');
// }

void main(List<String> arguments) {
  final channel = IOWebSocketChannel.connect(
      'wss://ws.binaryws.com/websockets/v3?app_id=1089');

  channel.stream.listen((tick) {
    final decodedMessage = jsonDecode(tick);
    final serverTimeAsEpoch = decodedMessage['tick']['epoch'];
    final price = decodedMessage['tick']['quote'];
    final name = decodedMessage['tick']['symbol'];
    final serverTime =
        DateTime.fromMillisecondsSinceEpoch(serverTimeAsEpoch * 1000);
    print('Name: $name' + ' ' + 'Price: $price' + ' ' + 'Date: $serverTime');
  });

  channel.sink.add('{"ticks": "frxAUDCAD"}');
}
