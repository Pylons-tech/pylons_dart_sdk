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

  Transaction({required this.state, required this.txData, required this.stdTx, required this.responseCode, required this.rawLog});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        stdTx: StdTx.fromJson(json['stdTx']), rawLog: json['rawLog'], txData: TxData.fromJson(json['txData']), state: json['state'].toString().toTxStateEnum(), responseCode: json['responseCode']);
  }
}

const int responseCodeOk = 0;
const int responseCodeError = -1;

/// TODO: Doc comment
enum TxState { notYetSent, notYetAccepted, committed, refused }


extension TxStatePar on String {
  TxState toTxStateEnum() {
    return TxState.values.firstWhere(
            (e) => e.toString().toLowerCase() == 'TxState.$this'.toLowerCase(),
        orElse: () => TxState.notYetSent); //return null if not found
  }
}

/// TODO: Doc comment
class StdTx {
  List<Msg> msgs;
  StdFee fee;
  List<StdSignature> signatures;
  String memo;

  StdTx({required this.msgs, required this.fee, required this.signatures, required this.memo});

  factory StdTx.fromJson(Map<String, dynamic> json) {
    return StdTx(fee: StdFee.fromJson(json['fee']), signatures: [...List.from(json['signatures']).map((e) => StdSignature.fromJson(e)).toList()], msgs: [], memo: json['memo']);
  }
}

/// TODO: Doc comment
class StdFee {
  Map<String, int> amount;
  int gas;

  StdFee({required this.amount, required this.gas});

  factory StdFee.fromJson(Map<String, dynamic> json) {
    return StdFee(
      gas: json['gas'],
      amount: json['amount'],
    );
  }
}

/// TODO: Doc comment
class StdSignature {
  String signature;
  PubKey pubKey;

  StdSignature({required this.signature, required this.pubKey});

  factory StdSignature.fromJson(Map<String, dynamic> json) {
    return StdSignature(
      pubKey: PubKey.fromJson(json['pubKey']),
      signature: json['signature'],
    );
  }
}

/// TODO: Doc comment
class PubKey {
  String type;
  String value;

  PubKey({required this.type, required this.value});

  factory PubKey.fromJson(Map<String, dynamic> json) {
    return PubKey(
      value: json['value'],
      type: json['type'],
    );
  }
}

/// TODO: Doc comment
class TxData {
  String msg;
  String status;
  List<TxDataOutput> output;

  TxData({required this.msg, required this.status, required this.output});

  factory TxData.fromJson(json) {
    return TxData(output: [...List.from(json['output']).map((e) => TxDataOutput.fromJson(e)).toList()], msg: json['msg'], status: json['status']);
  }
}

/// TODO: Doc comment
class TxDataOutput {
  String type;
  String coin;
  int amount;
  String itemId;

  TxDataOutput({required this.type, required this.coin, required this.amount, required this.itemId});

  factory TxDataOutput.fromJson(Map<String, dynamic> json) {
    return TxDataOutput(itemId: json['itemId'], type: json['type'], amount: json['amount'], coin: json['coin']);
  }
}
