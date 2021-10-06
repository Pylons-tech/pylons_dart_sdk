/// Types and functionality for dealing with items.
library pylons_flutter_item;

/// An item that exists (or can exist) on the Pylons chain.
class Item {
  String? id;
  String nodeVersion;
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
      {this.id,
      required this.nodeVersion,
      required this.cookbookId,
      required this.sender,
      required this.ownerRecipeId,
      required this.ownerTradeId,
      required this.tradable,
      required this.lastUpdate,
      required this.transferFee,
      required this.doubles,
      required this.longs,
      required this.strings});
}
