/// Types and functionality for dealing with TX message data.
library pylons_flutter_transaction_msg;

import 'package:pylons_flutter/src/recipe.dart';
import 'package:pylons_flutter/src/trade.dart';

import '../pylons_flutter.dart';

/// TODO: Doc comment
abstract class Msg {
  // TODO: everything
}

/// TODO: Doc comment
class CheckExecution implements Msg {
  String sender;
  String execId;
  bool payToComplete;

  CheckExecution(this.execId, this.sender, this.payToComplete);
}

/// TODO: Doc comment
class CreateAccount implements Msg {
  String sender;

  CreateAccount(this.sender);
}

/// TODO: Doc comment
class CreateCookbook implements Msg {
  String sender;
  String cookbookId;
  String name;
  String description;
  String version;
  String developer;
  String supportEmail;
  int costPerBlock;

  CreateCookbook(this.sender, this.cookbookId, this.name, this.description,
      this.version, this.developer, this.supportEmail, this.costPerBlock);
}

/// TODO: Doc comment
class CreateRecipe implements Msg {
  String sender;
  String name;
  String recipeId;
  String cookbookId;
  String description;
  List<CoinInput> coinInputs;
  List<ItemInput> itemInputs;
  List<WeightedOutput> outputs;
  EntriesList entries;
  int blockInterval;
  String extraInfo;

  CreateRecipe(
      this.sender,
      this.name,
      this.recipeId,
      this.cookbookId,
      this.description,
      this.coinInputs,
      this.itemInputs,
      this.outputs,
      this.entries,
      this.blockInterval,
      this.extraInfo);
}

/// TODO: Doc comment
class CreateTrade implements Msg {
  String sender;
  List<CoinInput> coinInputs;
  List<TradeItemInput> itemInputs;
  Map<String, int> coinOutputs;
  List<Item> itemOutputs;
  String extraInfo;

  CreateTrade(this.sender, this.coinInputs, this.itemInputs, this.coinOutputs,
      this.itemOutputs, this.extraInfo);
}

/// TODO: Doc comment
class DisableRecipe implements Msg {
  String sender;
  String recipeId;

  DisableRecipe(this.sender, this.recipeId);
}

/// TODO: Doc comment
class DisableTrade implements Msg {
  String sender;
  String tradeId;

  DisableTrade(this.sender, this.tradeId);
}

/// TODO: Doc comment
class EnableRecipe implements Msg {
  String sender;
  String recipeId;

  EnableRecipe(this.sender, this.recipeId);
}

/// TODO: Doc comment
class EnableTrade implements Msg {
  String sender;
  String tradeId;

  EnableTrade(this.sender, this.tradeId);
}

/// TODO: Doc comment
class ExecuteRecipe implements Msg {
  String sender;
  String recipeId;
  List<String> itemIds;
  String paymentId;
  String paymentMethod;

  ExecuteRecipe(this.sender, this.recipeId, this.itemIds, this.paymentId,
      this.paymentMethod);
}

/// TODO: Doc comment
class FiatItem implements Msg {
  String sender;
  String cookbookId;
  Map<String, double> doubles;
  Map<String, int> longs;
  Map<String, String> strings;
  int transferFee;

  FiatItem(this.sender, this.cookbookId, this.doubles, this.longs, this.strings,
      this.transferFee);
}

/// TODO: Doc comment
class FulfillTrade implements Msg {
  String sender;
  String tradeId;
  List<String> itemIds;
  String paymentId;

  FulfillTrade(this.sender, this.tradeId, this.itemIds, this.paymentId);
}

/// TODO: Doc comment
class GetPylons implements Msg {
  String sender;
  Map<String, int> amount;

  GetPylons(this.sender, this.amount);
}

/// TODO: Doc comment
class GoogleIapGetPylons implements Msg {
  String sender;
  String productId;
  String purchaseToken;
  String receiptDataBase64;
  String signature;

  GoogleIapGetPylons(this.sender, this.productId, this.purchaseToken,
      this.receiptDataBase64, this.signature);
}

/// TODO: Doc comment
class SendCoins implements Msg {
  String sender;
  String receiver;
  Map<String, int> amount;

  SendCoins(this.sender, this.receiver, this.amount);
}

/// TODO: Doc comment
class SendItems implements Msg {
  String sender;
  String receiver;
  Map<String, String> itemIds;

  SendItems(this.sender, this.receiver, this.itemIds);
}

/// TODO: Doc comment
class UpdateCookbook implements Msg {
  String sender;
  String cookbookId;
  String description;
  String version;
  String developer;
  String supportEmail;

  UpdateCookbook(this.sender, this.cookbookId, this.description, this.version,
      this.developer, this.supportEmail);
}

/// TODO: Doc comment
class UpdateItemString implements Msg {
  String sender;
  String itemId;
  String field;
  String value;

  UpdateItemString(this.sender, this.itemId, this.field, this.value);
}

/// TODO: Doc comment
class UpdateRecipe implements Msg {
  String sender;
  String name;
  String recipeId;
  String cookbookId;
  String description;
  List<CoinInput> coinInputs;
  List<ItemInput> itemInputs;
  List<WeightedOutput> outputs;
  EntriesList entries;
  int blockInterval;
  String extraInfo;

  UpdateRecipe(
      this.sender,
      this.name,
      this.recipeId,
      this.cookbookId,
      this.description,
      this.coinInputs,
      this.itemInputs,
      this.outputs,
      this.entries,
      this.blockInterval,
      this.extraInfo);
}
