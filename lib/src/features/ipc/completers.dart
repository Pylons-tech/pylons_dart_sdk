import 'dart:async';

import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';

import '../../../pylons_sdk.dart';

Completer<SDKIPCResponse> cookBookCompleter = Completer();
Completer<SDKIPCResponse> cookBookUpdateCompleter = Completer();
Completer<SDKIPCResponse> recipeCompleter = Completer();
Completer<SDKIPCResponse> recipeUpdateCompleter = Completer();
Completer<SDKIPCResponse> executeRecipeCompleter = Completer();
Completer<SDKIPCResponse> enableRecipeCompleter = Completer();
Completer<SDKIPCResponse> getProfileCompleter = Completer();
Completer<SDKIPCResponse<List<Recipe>>> getAllRecipesCompleter = Completer();
Completer<SDKIPCResponse<Cookbook>> getCookBookCompleter = Completer();