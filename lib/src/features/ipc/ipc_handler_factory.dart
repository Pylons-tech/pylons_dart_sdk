import 'package:pylons_flutter/src/core/constants/strings.dart';
import 'package:pylons_flutter/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_flutter/src/features/ipc/responseCompleters.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';

class IPCHandlerFactory {
  static void getHandler(SDKIPCResponse sdkipcResponse) {
    if (!responseCompleters.containsKey(sdkipcResponse.action)) {
      throw Exception('Unexpected response for unsent message of type ${sdkipcResponse.action}');
    }
    responseCompleters[sdkipcResponse.action]!.complete(sdkipcResponse);
    return;
  }
}
