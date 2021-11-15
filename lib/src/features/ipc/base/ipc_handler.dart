import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';

abstract class IPCHandler {
  void handler(SDKIPCResponse response);
}
