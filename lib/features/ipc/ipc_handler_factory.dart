import 'package:pylons_flutter/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_flutter/src/features/ipc/handlers/existance_ipc_handler.dart';

class IPCHandlerFactory {
  static IPCHandler getHandler(String link) {
    return ExistanceIPCHandler(link);
  }
}
