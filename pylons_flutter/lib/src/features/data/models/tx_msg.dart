/// Types and functionality for dealing with TX message data.
library pylons_flutter_transaction_msg;

import 'item.dart';
import 'recipe.dart';
import 'trade.dart';

/// TODO: Doc comment
abstract class Msg {
  // TODO: everything
}

/// TODO: Doc comment
class CheckExecution implements Msg {
  String sender;
  String execId;
  bool payToComplete;

  CheckExecution(
      {required this.execId,
      required this.sender,
      required this.payToComplete});
}

/// TODO: Doc comment
class CreateAccount implements Msg {
  String sender;

  CreateAccount({required this.sender});
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

  CreateCookbook(
      {required this.sender,
      required this.cookbookId,
      required this.name,
      required this.description,
      required this.version,
      required this.developer,
      required this.supportEmail,
      required this.costPerBlock});
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
      {required this.sender,
      required this.name,
      required this.recipeId,
      required this.cookbookId,
      required this.description,
      required this.coinInputs,
      required this.itemInputs,
      required this.outputs,
      required this.entries,
      required this.blockInterval,
      required this.extraInfo});
}

/// TODO: Doc comment
class CreateTrade implements Msg {
  String sender;
  List<CoinInput> coinInputs;
  List<TradeItemInput> itemInputs;
  Map<String, int> coinOutputs;
  List<Item> itemOutputs;
  String extraInfo;

  CreateTrade(
      {required this.sender,
      required this.coinInputs,
      required this.itemInputs,
      required this.coinOutputs,
      required this.itemOutputs,
      required this.extraInfo});
}

/// TODO: Doc comment
class DisableRecipe implements Msg {
  String sender;
  String recipeId;

  DisableRecipe({required this.sender, required this.recipeId});
}

/// TODO: Doc comment
class DisableTrade implements Msg {
  String sender;
  String tradeId;

  DisableTrade({required this.sender, required this.tradeId});
}

/// TODO: Doc comment
class EnableRecipe implements Msg {
  String sender;
  String recipeId;

  EnableRecipe({required this.sender, required this.recipeId});
}

/// TODO: Doc comment
class EnableTrade implements Msg {
  String sender;
  String tradeId;

  EnableTrade({required this.sender, required this.tradeId});
}

/// TODO: Doc comment
class ExecuteRecipe implements Msg {
  String sender;
  String recipeId;
  List<String> itemIds;
  String paymentId;
  String paymentMethod;

  ExecuteRecipe(
      {required this.sender,
      required this.recipeId,
      required this.itemIds,
      required this.paymentId,
      required this.paymentMethod});
}

/// TODO: Doc comment
class FiatItem implements Msg {
  String sender;
  String cookbookId;
  Map<String, double> doubles;
  Map<String, int> longs;
  Map<String, String> strings;
  int transferFee;

  FiatItem(
      {required this.sender,
      required this.cookbookId,
      required this.doubles,
      required this.longs,
      required this.strings,
      required this.transferFee});
}

/// TODO: Doc comment
class FulfillTrade implements Msg {
  String sender;
  String tradeId;
  List<String> itemIds;
  String paymentId;

  FulfillTrade(
      {required this.sender,
      required this.tradeId,
      required this.itemIds,
      required this.paymentId});
}

/// TODO: Doc comment
class GetPylons implements Msg {
  String sender;
  Map<String, int> amount;

  GetPylons({required this.sender, required this.amount});
}

/// TODO: Doc comment
class GoogleIapGetPylons implements Msg {
  String sender;
  String productId;
  String purchaseToken;
  String receiptDataBase64;
  String signature;

  GoogleIapGetPylons(
      {required this.sender,
      required this.productId,
      required this.purchaseToken,
      required this.receiptDataBase64,
      required this.signature});
}

/// TODO: Doc comment
class SendCoins implements Msg {
  String sender;
  String receiver;
  Map<String, int> amount;

  SendCoins(
      {required this.sender, required this.receiver, required this.amount});
}

/// TODO: Doc comment
class SendItems implements Msg {
  String sender;
  String receiver;
  Map<String, String> itemIds;

  SendItems(
      {required this.sender, required this.receiver, required this.itemIds});
}

/// TODO: Doc comment
class UpdateCookbook implements Msg {
  String sender;
  String cookbookId;
  String description;
  String version;
  String developer;
  String supportEmail;

  UpdateCookbook(
      {required this.sender,
      required this.cookbookId,
      required this.description,
      required this.version,
      required this.developer,
      required this.supportEmail});
}

/// TODO: Doc comment
class UpdateItemString implements Msg {
  String sender;
  String itemId;
  String field;
  String value;

  UpdateItemString(
      {required this.sender,
      required this.itemId,
      required this.field,
      required this.value});
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
      {required this.sender,
      required this.name,
      required this.recipeId,
      required this.cookbookId,
      required this.description,
      required this.coinInputs,
      required this.itemInputs,
      required this.outputs,
      required this.entries,
      required this.blockInterval,
      required this.extraInfo});
}
