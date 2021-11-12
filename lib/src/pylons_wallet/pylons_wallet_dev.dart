import 'dart:async';
import 'dart:convert';

import 'package:pylons_flutter/src/core/constants/strings.dart';
import 'package:pylons_flutter/src/features/ipc/completers.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_message.dart';
import 'package:pylons_flutter/src/generated/pylons/recipe.pb.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_flutter/src/pylons_wallet/pylons_wallet_impl.dart';
import 'package:uni_links/uni_links.dart';
import '../../pylons_flutter.dart';
import '../pylons_wallet_comm_util.dart';
import 'package:uni_links_platform_interface/uni_links_platform_interface.dart';

/// The Pylons class is used for the test net .
class PylonsWalletDevImpl extends PylonsWalletImpl {
  PylonsWalletDevImpl(host, uniLink) : super(host: host, uniLink: uniLink);

  @override
  Future<SDKIPCResponse> txCreateRecipe(Recipe recipe) async {
    return Future<SDKIPCResponse>.sync(() async {
      PylonsWalletCommUtil.validateRecipe(recipe);
      var key = Strings.TX_CREATE_RECIPE;

      var sdkIPCMessage =
          SDKIPCMessage(key, jsonEncode(recipe.toProto3Json()), host);

      recipeCompleter = Completer();

      var response = await sendMessageNew(sdkIPCMessage, recipeCompleter);
      return response;
    });
  }
}
