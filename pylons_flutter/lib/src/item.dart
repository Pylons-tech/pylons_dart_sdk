library pylons_flutter_item;

/// An item that exists (or can exist) on the Pylons chain.
class Item {
  String nodeVersion;
  String id;
  String cookbookId;
  String sender;
  String ownerRecipeId;
  String ownerTradeId;
  bool tradable;
  int lastUpdate;
  int transferFee;
  Map<String, double> doubles;
  Map<String, int> longs;
  Map<String, String> strings;

  Item(
      this.nodeVersion,
      this.id,
      this.cookbookId,
      this.sender,
      this.ownerRecipeId,
      this.ownerTradeId,
      this.tradable,
      this.lastUpdate,
      this.transferFee,
      this.doubles,
      this.longs,
      this.strings);
}
