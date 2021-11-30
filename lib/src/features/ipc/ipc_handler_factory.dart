import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_sdk/src/features/ipc/handlers/get_cookbooks_handler.dart';
import 'package:pylons_sdk/src/features/ipc/handlers/get_recipe_handler.dart';
import 'package:pylons_sdk/src/features/ipc/handlers/get_recipes_handler.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

class IPCHandlerFactory {
  static final Map<String, IPCHandler> handlers = {
    Strings.GET_COOKBOOK : GetCookbooksHandler(),
    Strings.GET_RECIPES : GetRecipesHandler(),
    Strings.GET_RECIPE : GetRecipeHandler()
  };

  /// Fetches and resolves appropriate [IPCHandler] instance for [sdkIpcResponse], or completes
  /// the completer if no specific handler is set.
  static void getHandler(SDKIPCResponse sdkipcResponse) {
    if (!responseCompleters.containsKey(sdkipcResponse.action)) {
      throw Exception('Unexpected response for unsent message of type ${sdkipcResponse.action}');
    }
    if (handlers.containsKey(sdkipcResponse.action)) {
      handlers[sdkipcResponse.action]!.handler(sdkipcResponse);
    }
    else {
      responseCompleters[sdkipcResponse.action]!.complete(sdkipcResponse);
    }
    return;
  }
}
