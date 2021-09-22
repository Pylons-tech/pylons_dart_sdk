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

  Trade(
      this.nodeVersion,
      this.id,
      this.coinInputs,
      this.itemInputs,
      this.coinOutputs,
      this.itemOutputs,
      this.sender,
      this.fulfiller,
      this.extraInfo,
      this.disabled,
      this.completed);
}

/// TODO: describe this
class TradeItemInput {
  String cookbookId;
  ItemInput itemInput;

  TradeItemInput(this.cookbookId, this.itemInput);
}
