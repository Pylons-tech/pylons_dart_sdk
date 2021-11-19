import 'package:pylons_sdk/src/pylons_wallet/pylons_wallet_impl.dart';

/// Wallet used for testnet.
/// TODO: does this even need to exist
class PylonsWalletDevImpl extends PylonsWalletImpl {
  PylonsWalletDevImpl(host, uniLink) : super(host: host, uniLink: uniLink);
}