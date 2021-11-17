import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_sdk/pylons_sdk.dart';
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/completers.dart';
import 'package:pylons_sdk/src/features/ipc/handlers/get_cookbook_handler.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

import '../../../../mocks/mock_constants.dart';

void main() {
  test('should complete the getCookBook Future ', () async {
    getCookBookCompleter = Completer();
    var sdkResponse = SDKIPCResponse(success: true, error: '', data: MOCK_COOKBOOK, errorCode: '', action: Strings.GET_COOKBOOK);

    var handler = GetCookBookHandler();


    Future.delayed(Duration(seconds: 1), (){
      handler.handler(sdkResponse);
    });


    var response = await getCookBookCompleter.future;


    expect(true, getCookBookCompleter.isCompleted);
    expect(true, response.success);
    expect(Strings.GET_COOKBOOK, response.action);
  });
}
