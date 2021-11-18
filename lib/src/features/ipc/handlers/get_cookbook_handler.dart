
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

import '../../../../pylons_sdk.dart';
import '../completers.dart';


class GetCookBookHandler implements IPCHandler{
  @override
  void handler(SDKIPCResponse<dynamic> response) {

    var defaultResponse = SDKIPCResponse<Cookbook>(success: response.success, action: response.action, data: Cookbook.create(), error: response.error, errorCode: response.errorCode);

    try {
      if (response.success) {
        defaultResponse.data =  Cookbook.create()..mergeFromProto3Json(response);
      }
    } on  Exception catch (_){
      defaultResponse.error = 'Cookbook Parsing Failed';
      defaultResponse.errorCode = Strings.ERR_MALFORMED_COOKBOOK;
    }

    getCookBookCompleter.complete(defaultResponse);
  }

}