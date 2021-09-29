/// Types and functionality for dealing with trades.
library pylons_flutter_trade;

import 'package:pylons_flutter/features/data/models/item.dart';
import 'package:pylons_flutter/features/data/models/recipe.dart';

/// A record of a trade that exists on a Pylons blockchain.
class Trade {
  String? id;
  String nodeVersion;
  List<CoinInput> coinInputs;
  List<TradeItemInput> itemInputs;
  Map<String, int> coinOutputs;
  List<Item> itemOutputs;
  String sender;
  String fulfiller;
  String extraInfo;
  bool disabled;
  bool completed;

  Trade(
      {this.id,
      required this.nodeVersion,
      required this.coinInputs,
      required this.itemInputs,
      required this.coinOutputs,
      required this.itemOutputs,
      required this.sender,
      required this.fulfiller,
      required this.extraInfo,
      required this.disabled,
      required this.completed});
}

/// TODO: describe this
class TradeItemInput {
  String cookbookId;
  ItemInput itemInput;

  TradeItemInput({required this.cookbookId, required this.itemInput});
}
