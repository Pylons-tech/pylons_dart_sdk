import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_sdk/src/features/ipc/completers.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

class IPCHandlerFactory {
  static void getHandler(SDKIPCResponse sdkipcResponse) {
    if (sdkipcResponse.action == Strings.TX_CREATE_COOKBOOK) {
      cookBookCompleter.complete(sdkipcResponse);
      return;
    }

    if (sdkipcResponse.action == Strings.TX_UPDATE_COOKBOOK) {
      cookBookUpdateCompleter.complete(sdkipcResponse);
      return;
    }

    if (sdkipcResponse.action == Strings.TX_CREATE_RECIPE) {
      recipeCompleter.complete(sdkipcResponse);
      return;
    }

    if (sdkipcResponse.action == Strings.TX_EXECUTE_RECIPE) {
      executeRecipeCompleter.complete(sdkipcResponse);
      return;
    }

    if (sdkipcResponse.action == Strings.TX_UPDATE_RECIPE) {
      recipeUpdateCompleter.complete(sdkipcResponse);
      return;
    }

    if (sdkipcResponse.action == Strings.TX_ENABLE_RECIPE) {
      enableRecipeCompleter.complete(sdkipcResponse);
      return;
    }

    if (sdkipcResponse.action == Strings.GET_PROFILE) {
      getProfileCompleter.complete(sdkipcResponse);
      return;
    }


    if(sdkipcResponse.action == Strings.GET_RECIPES){
     var getRecipesHandler = GetRecipesHandler();
     getRecipesHandler.handler(sdkipcResponse);
      return;
    }



  }
}
