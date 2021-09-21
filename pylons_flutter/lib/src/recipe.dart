/// Types and functionality for dealing with recipes.
library pylons_flutter_recipe;

/// A recipe that exists (or can exist) on the Pylons chain, which can be
/// executed by users to generate coins and items.
class Recipe {
  String nodeVersion;
  String sender;
  String id;
  String name;
  String cookbookId;
  String description;
  String extraInfo;
  bool disabled;
  int blockInterval;
  List<CoinInput> coinInputs;
  List<ItemInput> itemInputs;
  EntriesList entries;
  List<WeightedOutput> outputs;

  Recipe(
      this.nodeVersion,
      this.sender,
      this.id,
      this.disabled,
      this.name,
      this.cookbookId,
      this.description,
      this.extraInfo,
      this.blockInterval,
      this.coinInputs,
      this.itemInputs,
      this.entries,
      this.outputs);

  /// Generate a web link for this recipe.
  String generateWebLink() {
    throw UnimplementedError();
  }
}

/// Specifies a coin to be consumed by a [Recipe].
class CoinInput {
  String coin;
  int count;

  CoinInput(this.coin, this.count);
}

/// Describes an item to be consumed by a [Recipe].
class ItemInput {
  String id;
  ConditionList conditions;
  List<DoubleInputParam> doubles;
  List<LongInputParam> longs;
  List<StringInputParam> strings;
  FeeInputParam transferFee;

  ItemInput(this.id, this.conditions, this.doubles, this.longs, this.strings,
      this.transferFee);
}

/// TODO: Describe the difference between these fields and the ones in the parent
/// [ItemInput]
class ConditionList {
  List<DoubleInputParam> doubles;
  List<LongInputParam> longs;
  List<StringInputParam> strings;

  ConditionList(this.doubles, this.longs, this.strings);
}

/// Describes the legal values for a double on an item, if it's to be accepted
/// for an [ItemInput].
class DoubleInputParam {
  String key;
  double minValue;
  double maxValue;

  DoubleInputParam(this.key, this.minValue, this.maxValue);
}

/// Describes the legal values for a long on an item, if it's to be accepted
/// for an [ItemInput].
class LongInputParam {
  String key;
  int minValue;
  int maxValue;

  LongInputParam(this.key, this.minValue, this.maxValue);
}

/// Describes the legal values for a string on an item, if it's to be accepted
/// for an [ItemInput].
class StringInputParam {
  String key;
  String value;

  StringInputParam(this.key, this.value);
}

/// Describes a fee associated with the transfer of an [Item].
/// TODO: not sure this is right
class FeeInputParam {
  int minValue;
  int maxValue;

  FeeInputParam(this.minValue, this.maxValue);
}

/// TODO: Describe the relationship between this and [WeightedOutput] sanely
class EntriesList {
  List<CoinOutput> coinOutputs;
  List<ItemModifyOutput> itemModifyOutputs;
  List<ItemOutput> itemOutputs;

  EntriesList(this.coinOutputs, this.itemModifyOutputs, this.itemOutputs);
}

/// TODO: Describe the relationship between this and [EntriesList] sanely
class WeightedOutput {
  List<String> entryIds;
  double weight;

  WeightedOutput(this.entryIds, this.weight);
}

/// Describes the parameters for outputting a [Coin] from a [Recipe].
class CoinOutput {
  String id;
  String coin;
  int count;

  CoinOutput(this.id, this.coin, this.count);
}

/// Describes the parameters by which a [Recipe] may modify an existing [Item].
class ItemModifyOutput {
  int itemInputRef;
  List<DoubleParam> doubles;
  List<LongParam> longs;
  List<StringParam> strings;
  int transferFee;

  ItemModifyOutput(this.itemInputRef, this.doubles, this.longs, this.strings,
      this.transferFee);
}

/// Describes the parameters by which a [Recipe] may generate a new [Item].
class ItemOutput {
  String id;
  List<DoubleParam> doubles;
  List<LongParam> longs;
  List<StringParam> strings;
  int transferFee;

  ItemOutput(this.id, this.doubles, this.longs, this.strings, this.transferFee);
}

/// TODO: describe this
class DoubleParam {
  double weight;
  String key;
  List<DoubleWeightRange> ranges;
  String program;

  DoubleParam(this.weight, this.key, this.ranges, this.program);
}

/// TODO: describe this
class DoubleWeightRange {
  double upper;
  double lower;
  double weight;

  DoubleWeightRange(this.upper, this.lower, this.weight);
}

/// TODO: describe this
class LongParam {
  int weight;
  String key;
  List<LongWeightRange> ranges;
  String program;

  LongParam(this.weight, this.key, this.ranges, this.program);
}

/// TODO: describe this
class LongWeightRange {
  int upper;
  int lower;
  int weight;

  LongWeightRange(this.upper, this.lower, this.weight);
}

/// TODO: describe this
class StringParam {
  int weight;
  String key;
  String value;
  String program;

  StringParam(this.weight, this.key, this.value, this.program);
}
