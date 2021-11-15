import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/src/features/ipc/completers.dart';
import 'package:pylons_flutter/src/features/ipc/handlers/get_recipes_handler.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';

void main() {
  test('should complete the get All recipe future', () {
    getAllRecipes = Completer();
    var sdkResponse = SDKIPCResponse(success: false, error: '', data: '', errorCode: '', action: '');

    var handler = GetRecipesHandler();

    handler.handler(sdkResponse);

    expect(true, getAllRecipes.isCompleted);
  });
}
