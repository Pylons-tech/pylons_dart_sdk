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
      this.state, this.txData, this.stdTx, this.responseCode, this.rawLog);
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

  StdTx(this.msgs, this.fee, this.signatures, this.memo);
}

/// TODO: Doc comment
class StdFee {
  Map<String, int> amount;
  int gas;

  StdFee(this.amount, this.gas);
}

/// TODO: Doc comment
class StdSignature {
  String signature;
  PubKey pubKey;

  StdSignature(this.signature, this.pubKey);
}

/// TODO: Doc comment
class PubKey {
  String type;
  String value;

  PubKey(this.type, this.value);
}

/// TODO: Doc comment
class TxData {
  String msg;
  String status;
  List<TxDataOutput> output;

  TxData(this.msg, this.status, this.output);
}

/// TODO: Doc comment
class TxDataOutput {
  String type;
  String coin;
  int amount;
  String itemId;

  TxDataOutput(this.type, this.coin, this.amount, this.itemId);
}
