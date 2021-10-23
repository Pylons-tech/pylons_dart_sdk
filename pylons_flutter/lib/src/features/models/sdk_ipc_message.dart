import 'dart:convert';

class SDKIPCMessage {
  String action;
  String json;
  String sender;

  SDKIPCMessage(this.action, this.json, this.sender);

  factory SDKIPCMessage.fromIPCMessage(String base64EncodedMessage){

    final json = utf8.decode(base64Url.decode(base64EncodedMessage));
    final jsonMap = jsonDecode(json);

    return SDKIPCMessage(jsonMap['action'].toString(), jsonMap['json'].toString(), jsonMap['sender'].toString());
  }



  String toJson() => jsonEncode(
      {
        'sender' : sender,
        'json' : json,
        'action' : action
      }
  );

  String createMessage() => base64Url.encode(utf8.encode(toJson()));

  @override
  String toString() {
    return 'SDKIPCMessage{action: $action, json: $json, sender: $sender}';
  }
}