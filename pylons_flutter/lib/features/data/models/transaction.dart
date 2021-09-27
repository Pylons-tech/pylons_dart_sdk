/// Types and functionality for dealing with transactions.
library pylons_flutter_transaction;

import 'tx_msg.dart';

/// TODO: Doc comment
class Transaction {
  TxState state;
  TxData txData;
  StdTx stdTx;
  int responseCode;
  String rawLog;

  Transaction(
      {required this.state,
      required this.txData,
      required this.stdTx,
      required this.responseCode,
      required this.rawLog});
}

const int responseCodeOk = 0;
const int responseCodeError = -1;

/// TODO: Doc comment
enum TxState { notYetSent, notYetAccepted, committed, refused }

/// TODO: Doc comment
class StdTx {
  List<Msg> msgs;
  StdFee fee;
  List<StdSignature> signatures;
  String memo;

  StdTx(
      {required this.msgs,
      required this.fee,
      required this.signatures,
      required this.memo});
}

/// TODO: Doc comment
class StdFee {
  Map<String, int> amount;
  int gas;

  StdFee({required this.amount, required this.gas});
}

/// TODO: Doc comment
class StdSignature {
  String signature;
  PubKey pubKey;

  StdSignature({required this.signature, required this.pubKey});
}

/// TODO: Doc comment
class PubKey {
  String type;
  String value;

  PubKey({required this.type, required this.value});
}

/// TODO: Doc comment
class TxData {
  String msg;
  String status;
  List<TxDataOutput> output;

  TxData({required this.msg, required this.status, required this.output});
}

/// TODO: Doc comment
class TxDataOutput {
  String type;
  String coin;
  int amount;
  String itemId;

  TxDataOutput(
      {required this.type,
      required this.coin,
      required this.amount,
      required this.itemId});
}
