import 'dart:convert';

class SDKIPCResponse {

  bool success;
  String errorCode;
  String error;
  dynamic data;
  String sender;
  String action;

  SDKIPCResponse({required this.success, required this.error, required this.data, required this.sender, required this.errorCode, required this.action});


  factory SDKIPCResponse.success({required dynamic data, required String sender, required String transaction}){
    return SDKIPCResponse(sender: sender, data: data, success: true, error: '', errorCode: '', action: transaction);
  }

  factory SDKIPCResponse.failure({required String error, required String sender, required String errorCode, required String transaction}){
    return SDKIPCResponse(sender: sender, data: '', success: false, error: error, errorCode: errorCode, action:transaction );
  }

  String toBas64Hash() => base64Url.encode(utf8.encode(toJson()));

  String toJson() => jsonEncode({
    'success' : success,
    'error' : error,
    'data' : data,
    'transaction': action
  });

  String createMessageLink()=> 'pylons://$sender/${toBas64Hash()}';

  @override
  String toString() {
    return 'SDKIPCResponse{success: $success, errorCode: $errorCode, error: $error, data: $data, sender: $sender, action: $action}';
  }
}