import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/ipc_handler_factory.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

import '../../../mocks/mock_constants.dart';

void main() {
  void _genericResponseTestFlow(String key) {
    initResponseCompleter(key);
    expect(false, responseCompleters[key]!.isCompleted);
    var sdkResponse = SDKIPCResponse(success: true,
        error: '',
        data: '',
        errorCode: '',
        action: key);
    IPCHandlerFactory.getHandler(sdkResponse);
    expect(true, responseCompleters[key]!.isCompleted);
  }

  test('Should complete completers when appropriate response arrives', () {
    _genericResponseTestFlow(Strings.TX_CREATE_COOKBOOK);
    _genericResponseTestFlow(Strings.TX_UPDATE_COOKBOOK);
    _genericResponseTestFlow(Strings.TX_CREATE_RECIPE);
    _genericResponseTestFlow(Strings.TX_UPDATE_RECIPE);
    _genericResponseTestFlow(Strings.TX_EXECUTE_RECIPE);
    _genericResponseTestFlow(Strings.GET_PROFILE);
  });
}