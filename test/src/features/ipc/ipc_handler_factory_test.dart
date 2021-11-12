import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/src/core/constants/strings.dart';
import 'package:pylons_flutter/src/features/ipc/completers.dart';
import 'package:pylons_flutter/src/features/ipc/ipc_handler_factory.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';

void main() {
  test('should complete the creation of cookbook when response arrives', () {
    cookBookCompleter = Completer();

    expect(false, cookBookCompleter.isCompleted);

    var sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_CREATE_COOKBOOK);
    IPCHandlerFactory.getHandler(sdkResponse);

    expect(true, cookBookCompleter.isCompleted);
  });




  test('should complete the updating of cookbook when response arrives', () {
    cookBookUpdateCompleter = Completer();

    expect(false, cookBookUpdateCompleter.isCompleted);

    var sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_UPDATE_COOKBOOK);
    IPCHandlerFactory.getHandler(sdkResponse);

    expect(true, cookBookUpdateCompleter.isCompleted);
  });



  test('should complete the creation of recipe when response arrives', () {
    recipeCompleter = Completer();

    expect(false, recipeCompleter.isCompleted);

    var sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_CREATE_RECIPE);
    IPCHandlerFactory.getHandler(sdkResponse);

    expect(true, recipeCompleter.isCompleted);
  });


  test('should complete the updation of recipe when response arrives', () {
    recipeUpdateCompleter = Completer();

    expect(false, recipeUpdateCompleter.isCompleted);

    var sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_UPDATE_RECIPE);
    IPCHandlerFactory.getHandler(sdkResponse);

    expect(true, recipeUpdateCompleter.isCompleted);
  });


  test('should complete the execution of recipe when response arrives', () {
    executeRecipeCompleter = Completer();

    expect(false, executeRecipeCompleter.isCompleted);

    var sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_EXECUTE_RECIPE);
    IPCHandlerFactory.getHandler(sdkResponse);

    expect(true, executeRecipeCompleter.isCompleted);
  });




  test('should complete the enabling of recipe when response arrives', () {
    enableRecipeCompleter = Completer();

    expect(false, enableRecipeCompleter.isCompleted);

    var sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_ENABLE_RECIPE);
    IPCHandlerFactory.getHandler(sdkResponse);

    expect(true, enableRecipeCompleter.isCompleted);
  });






  test('should complete the retrieval of user profile', () {
    getProfileCompleter = Completer();

    expect(false, getProfileCompleter.isCompleted);

    var sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.GET_PROFILE);
    IPCHandlerFactory.getHandler(sdkResponse);

    expect(true, getProfileCompleter.isCompleted);
  });





}
