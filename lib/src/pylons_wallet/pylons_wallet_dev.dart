import 'dart:async';
import 'dart:convert';

import 'package:pylons_flutter/src/core/constants/strings.dart';
import 'package:pylons_flutter/src/features/ipc/responseCompleters.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_message.dart';
import 'package:pylons_flutter/src/generated/pylons/recipe.pb.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_flutter/src/pylons_wallet/pylons_wallet_impl.dart';
import 'package:uni_links/uni_links.dart';
import '../../pylons_flutter.dart';
import '../pylons_wallet_comm_util.dart';
import 'package:uni_links_platform_interface/uni_links_platform_interface.dart';

/// Wallet used for testnet.
/// TODO: does this even need to exist
class PylonsWalletDevImpl extends PylonsWalletImpl {
  PylonsWalletDevImpl(host, uniLink) : super(host: host, uniLink: uniLink);
}
