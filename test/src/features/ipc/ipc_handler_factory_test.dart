import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/ipc_handler_factory.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

import '../../../mocks/mock_constants.dart';

void main() {
  test('Should complete completers when appropriate response arrives', () {
    _genericResponseTestFlow(StringConst.TX_CREATE_COOKBOOK);
    _genericResponseTestFlow(StringConst.TX_UPDATE_COOKBOOK);
    _genericResponseTestFlow(StringConst.TX_CREATE_RECIPE);
    _genericResponseTestFlow(StringConst.TX_UPDATE_RECIPE);
    _genericResponseTestFlow(StringConst.TX_EXECUTE_RECIPE);
    _genericResponseTestFlow(StringConst.GET_PROFILE);
    _genericResponseTestFlow(StringConst.GET_EXECUTION_BY_ID);
    _genericResponseTestFlow(StringConst.GET_ITEMS_BY_OWNER);
  });

  test('should complete completer that needs handler', () {
    initResponseCompleter(StringConst.GET_RECIPES);
    expect(false, responseCompleters[StringConst.GET_RECIPES]!.isCompleted);
    var sdkResponse = SDKIPCResponse(
        success: true,
        error: '',
        data: [MOCK_RECIPE.toProto3Json()],
        errorCode: '',
        action: StringConst.GET_RECIPES);
    IPCHandlerFactory.getHandler(sdkResponse);
    expect(true, responseCompleters[StringConst.GET_RECIPES]!.isCompleted);
  });

  test('should throw error if unknown key is found', () {
    var sdkResponse = SDKIPCResponse(
        success: true,
        error: '',
        data: [MOCK_RECIPE.toProto3Json()],
        errorCode: '',
        action: MOCK_USERNAME);
    expect(() => IPCHandlerFactory.getHandler(sdkResponse),
        throwsA(isA<Exception>()));
  });
}

void _genericResponseTestFlow(String key) {
  initResponseCompleter(key);
  expect(false, responseCompleters[key]!.isCompleted);
  var sdkResponse = SDKIPCResponse(
      success: true, error: '', data: '', errorCode: '', action: key);
  IPCHandlerFactory.getHandler(sdkResponse);
  expect(true, responseCompleters[key]!.isCompleted);
}
