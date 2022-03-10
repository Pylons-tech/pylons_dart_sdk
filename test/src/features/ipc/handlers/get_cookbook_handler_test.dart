import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/handlers/get_cookbooks_handler.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

import '../../../../mocks/mock_constants.dart';

void main() {
  test('should complete the getCookBook Future ', () async {
    initResponseCompleter(StringConst.GET_COOKBOOK);
    final sdkResponse = SDKIPCResponse(
        success: true,
        error: '',
        data: MOCK_COOKBOOK,
        errorCode: '',
        action: StringConst.GET_COOKBOOK);
    final handler = GetCookbooksHandler();
    Future.delayed(Duration(seconds: 1), () {
      handler.handler(sdkResponse);
    });
    final response = await responseCompleters[StringConst.GET_COOKBOOK]!.future;
    expect(true, responseCompleters[StringConst.GET_COOKBOOK]!.isCompleted);
    expect(true, response.success);
    expect(StringConst.GET_COOKBOOK, response.action);
  });
}
