import 'dart:convert';

import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_sdk/src/features/models/user_info.dart';

class GetProfileHandler implements IPCHandler {
  @override
  void handler(SDKIPCResponse<dynamic> response) {
    print(response);
    final defaultResponse = SDKIPCResponse<UserInfoModel>(
        success: response.success,
        action: response.action,
        data: UserInfoModel.initial(),
        error: response.error,
        errorCode: response.errorCode);
    try {
      if (response.success) {
        defaultResponse.data =
            UserInfoModel.fromJson(jsonDecode(response.data));
      }
    } on FormatException catch (_) {
      defaultResponse.error = _.message;
      defaultResponse.errorCode = Strings.ERR_MALFORMED_USER_INFO;
      defaultResponse.success = false;
    }
    responseCompleters[Strings.GET_PROFILE]!.complete(defaultResponse);
  }
}
