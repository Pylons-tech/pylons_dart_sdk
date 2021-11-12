import 'dart:convert';

/// A response received from the wallet app.
class SDKIPCResponse {
  /// Was the operation successful?
  bool success;

  /// Error code, if an error occurred
  String errorCode;

  /// Any error that occurred
  String error;

  /// The body of the response
  dynamic data;

  /// The action that initiated this response
  String action;

  SDKIPCResponse(
      {required this.success,
      required this.error,
      required this.data,
      required this.errorCode,
      required this.action});

  factory SDKIPCResponse.fromIPCMessage(String base64EncodedMessage) {
    final json = utf8.decode(base64Url.decode(base64EncodedMessage));
    final jsonMap = jsonDecode(json);

    return SDKIPCResponse(
        error: jsonMap['error'],
        action: jsonMap['action'],
        errorCode: jsonMap['errorCode'],
        data: jsonMap['data'],
        success: jsonMap['success']);
  }

  String toBase64Hash() => base64Url.encode(utf8.encode(toJson()));

  String toJson() => jsonEncode({
        'success': success,
        'error': error,
        'data': data,
        'transaction': action
      });

  @override
  String toString() {
    return 'SDKIPCResponse{success: $success, errorCode: $errorCode, error: $error, data: $data, action: $action}';
  }
}
