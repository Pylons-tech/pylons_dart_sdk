
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

import '../../../../pylons_sdk.dart';
import '../completers.dart';


class GetRecipesHandler implements IPCHandler{
  @override
  void handler(SDKIPCResponse<dynamic> response) {

    var defaultResponse = SDKIPCResponse<List<Recipe>>(success: response.success, action: response.action, data: [], error: response.error, errorCode: response.errorCode);

    try {
      if (response.success) {
        defaultResponse.data = List.from(response.data).map((e){
          return Recipe.create()..mergeFromProto3Json(e);
        }).toList();
      }
    } on  Exception catch (_){
      defaultResponse.error = 'Recipe Parsing Failed';
      defaultResponse.errorCode = Strings.ERR_MALFORMED_RECIPES;
    }

    getAllRecipes.complete(defaultResponse);
  }

}