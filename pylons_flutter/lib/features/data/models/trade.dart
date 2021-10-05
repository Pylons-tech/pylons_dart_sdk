/// Types and functionality for dealing with trades.
library pylons_flutter_trade;

import 'package:pylons_flutter/features/data/models/item.dart';
import 'package:pylons_flutter/features/data/models/recipe.dart';

/// A record of a trade that exists on a Pylons blockchain.
class Trade {
  String nodeVersion;
  String id;
  List<CoinInput> coinInputs;
  List<TradeItemInput> itemInputs;
  Map<String, int> coinOutputs;
  List<Item> itemOutputs;
  String sender;
  String fulfiller;
  String extraInfo;
  bool disabled;
  bool completed;

  Trade({
      required this.nodeVersion,
      required this.id,
      required this.coinInputs,
      required this.itemInputs,
      required this.coinOutputs,
      required this.itemOutputs,
      required this.sender,
      required this.fulfiller,
      required this.extraInfo,
      required this.disabled,
      required this.completed});

  factory Trade.fromJson(Map<String, dynamic> json ){
    return Trade(nodeVersion: json['nodeVersion'], 
    id: json['id'], 
    coinInputs: json['coinInputs'], 
    itemInputs: json['itemInputs'], 
    coinOutputs: json['coinInputs'], 
    itemOutputs: json['itemOutputs'], 
    sender: json['sender'], 
    fulfiller: json['fulfiller'], 
    extraInfo: json['extraInfo'], 
    disabled: json['disabled'], 
    completed: json['completed']);
  }
}

/// TODO: describe this
class TradeItemInput {
  String cookbookId;
  ItemInput itemInput;

  TradeItemInput(this.cookbookId, this.itemInput);
}
