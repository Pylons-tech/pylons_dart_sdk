import 'dart:convert';

/// A message to be sent to the wallet app.
///
/// Stores raw, unencoded data which will then be used in IPC operations.
class SDKIPCMessage {
  /// The operation to be performed by the wallet.
  String action;

  /// The data supplied for that operation.
  String json;
  String sender;

  SDKIPCMessage(this.action, this.json, this.sender);

  factory SDKIPCMessage.fromIPCMessage(String base64EncodedMessage) {
    final json = utf8.decode(base64Url.decode(base64EncodedMessage));
    final jsonMap = jsonDecode(json);

    return SDKIPCMessage(jsonMap['action'].toString(),
        jsonMap['json'].toString(), jsonMap['sender'].toString());
  }

  String toJson() =>
      jsonEncode({'sender': sender, 'json': json, 'action': action});

  String createMessage() => base64Url.encode(utf8.encode(toJson()));

  @override
  String toString() {
    return 'SDKIPCMessage{action: $action, json: $json, sender: $sender}';
  }
}
