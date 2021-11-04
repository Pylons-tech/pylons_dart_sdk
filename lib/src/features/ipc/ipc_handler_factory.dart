import 'package:pylons_flutter/src/core/constants/strings.dart';
import 'package:pylons_flutter/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_flutter/src/features/ipc/completers.dart';
import 'package:pylons_flutter/src/features/ipc/handlers/existance_ipc_handler.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';

class IPCHandlerFactory {

  static void getHandler(SDKIPCResponse sdkipcResponse){

    if(sdkipcResponse.action == Strings.TX_CREATE_COOKBOOK){
      cookBookCompleter.complete(sdkipcResponse);
      return;
    }



    if(sdkipcResponse.action == Strings.TX_UPDATE_COOKBOOK){
      cookBookUpdateCompleter.complete(sdkipcResponse);
      return;
    }


    if(sdkipcResponse.action == Strings.TX_CREATE_RECIPE){
      recipeCompleter.complete(sdkipcResponse);
      return;
    }

    if(sdkipcResponse.action == Strings.TX_EXECUTE_RECIPE){
      executeRecipeCompleter.complete(sdkipcResponse);
      return;
    }

    if(sdkipcResponse.action == Strings.TX_UPDATE_RECIPE){
      recipeUpdateCompleter.complete(sdkipcResponse);
      return;
    }

  }
}