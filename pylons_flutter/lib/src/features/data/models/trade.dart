/// Types and functionality for dealing with trades.
library pylons_flutter_trade;


import '../../../../pylons_flutter.dart';
import 'recipe.dart';

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

  factory Trade.fromJson(Map<String, dynamic> json) {
    return Trade(
      coinOutputs: json['coinOutputs'],
      itemOutputs: [
        ...List.from(json['itemOutputs']).map((e) => Item.fromJson(e)).toList()
      ],
      extraInfo: json['extraInfo'],
      fulfiller: json['fulfiller'],
      nodeVersion: json['nodeVersion'],
      completed: json['completed'],
      sender: json['sender'],
      itemInputs: [
        ...List.from(json['itemOutputs'])
            .map((e) => TradeItemInput.fromJson(e))
            .toList()
      ],
      disabled: json['disabled'],
      coinInputs: [
        ...List.from(json['coinInputs'])
            .map((e) => CoinInput.fromJson(e))
            .toList()
      ],
    );
  }
}

/// TODO: describe this
class TradeItemInput {
  String cookbookId;
  ItemInput itemInput;

  TradeItemInput({required this.cookbookId, required this.itemInput});

  factory TradeItemInput.fromJson(Map<String, dynamic> json) {
    return TradeItemInput(
      cookbookId: json['cookbookId'],
      itemInput: ItemInput.fromJson(json['itemInput']),
    );
  }
}
