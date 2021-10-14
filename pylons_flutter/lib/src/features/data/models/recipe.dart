/// Types and functionality for dealing with recipes.
library pylons_flutter_recipe;

/// A recipe that exists (or can exist) on the Pylons chain, which can be
/// executed by users to generate coins and items.
class Recipe {
  String? id;
  String name;
  String cookbookId;
  String description;
  String version;
  String extraInfo;
  bool enabled;
  List<CoinInput> coinInputs;
  List<ItemInput> itemInputs;
  EntriesList entries;
  List<WeightedOutput> outputs;

  Recipe(
      {this.id,
      required this.enabled,
      required this.name,
      required this.cookbookId,
      required this.description,
      required this.version,
      required this.extraInfo,
      required this.coinInputs,
      required this.itemInputs,
      required this.entries,
      required this.outputs});

  /// Generate a web link for this recipe.
  String generateWebLink() {
    throw UnimplementedError();
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        extraInfo: json['extraInfo'],
        description: json['description'],
        name: json['name'],
        outputs: [],
        version: json['version'],
        coinInputs: [
          ...List.from(json['coinInputs'])
              .map((e) => CoinInput.fromJson(e))
              .toList()
        ],
        enabled: json['enabled'],
        entries: json['entries'],
        cookbookId: json['cookbookID'],
        itemInputs: [
          ...List.from(json['itemInputs'])
              .map((e) => ItemInput.fromJson(e))
              .toList()
        ]);
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

/// Specifies a coin to be consumed by a [Recipe].
class CoinInput {
  String coin;
  int count;

  CoinInput({required this.coin, required this.count});

  factory CoinInput.fromJson(Map<String, dynamic> json) {
    return CoinInput(count: json['count'], coin: json['coin']);
  }
}

/// Describes an item to be consumed by a [Recipe].
class ItemInput {
  String? id;
  ConditionList conditions;
  List<DoubleInputParam> doubles;
  List<LongInputParam> longs;
  List<StringInputParam> strings;
  FeeInputParam transferFee;

  ItemInput(
      {this.id,
      required this.conditions,
      required this.doubles,
      required this.longs,
      required this.strings,
      required this.transferFee});

  factory ItemInput.fromJson(Map<String, dynamic> json) {
    return ItemInput(
      longs: [
        ...List.from(json['longs'])
            .map((e) => LongInputParam.fromJson(e))
            .toList()
      ],
      strings: [
        ...List.from(json['strings'])
            .map((e) => StringInputParam.fromJson(e))
            .toList()
      ],
      conditions: ConditionList.fromJson(json['conditions']),
      transferFee: FeeInputParam.fromJson(json['transferFee']),
      doubles: [
        ...List.from(json['doubles'])
            .map((e) => DoubleInputParam.fromJson(e))
            .toList()
      ],
    );
  }
}

/// TODO: Describe the difference between these fields and the ones in the parent
/// [ItemInput]
class ConditionList {
  List<DoubleInputParam> doubles;
  List<LongInputParam> longs;
  List<StringInputParam> strings;

  ConditionList(
      {required this.doubles, required this.longs, required this.strings});

  factory ConditionList.fromJson(Map<String, dynamic> json) {
    return ConditionList(doubles: [
      ...List.from(json['doubles'])
          .map((e) => DoubleInputParam.fromJson(e))
          .toList()
    ], strings: [
      ...List.from(json['strings'])
          .map((e) => StringInputParam.fromJson(e))
          .toList()
    ], longs: [
      ...List.from(json['longs'])
          .map((e) => LongInputParam.fromJson(e))
          .toList()
    ]);
  }
}

/// Describes the legal values for a double on an item, if it's to be accepted
/// for an [ItemInput].
class DoubleInputParam {
  String key;
  double minValue;
  double maxValue;

  DoubleInputParam(
      {required this.key, required this.minValue, required this.maxValue});

  factory DoubleInputParam.fromJson(Map<String, dynamic> json) {
    return DoubleInputParam(
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      key: json['key'],
    );
  }
}

/// Describes the legal values for a long on an item, if it's to be accepted
/// for an [ItemInput].
class LongInputParam {
  String key;
  int minValue;
  int maxValue;

  LongInputParam(
      {required this.key, required this.minValue, required this.maxValue});

  factory LongInputParam.fromJson(Map<String, dynamic> json) {
    return LongInputParam(
        key: json['key'],
        maxValue: json['maxValue'],
        minValue: json['minValue']);
  }
}

/// Describes the legal values for a string on an item, if it's to be accepted
/// for an [ItemInput].
class StringInputParam {
  String key;
  String value;

  StringInputParam({required this.key, required this.value});

  factory StringInputParam.fromJson(Map<String, dynamic> json) {
    return StringInputParam(key: json['key'], value: json['value']);
  }
}

/// Describes a fee associated with the transfer of an [Item].
/// TODO: not sure this is right
class FeeInputParam {
  int minValue;
  int maxValue;

  FeeInputParam({required this.minValue, required this.maxValue});

  factory FeeInputParam.fromJson(Map<String, dynamic> json) {
    return FeeInputParam(
        maxValue: json['maxValue'], minValue: json['minValue']);
  }
}

/// TODO: Describe the relationship between this and [WeightedOutput] sanely
class EntriesList {
  List<CoinOutput> coinOutputs;
  List<ItemModifyOutput> itemModifyOutputs;
  List<ItemOutput> itemOutputs;

  EntriesList(
      {required this.coinOutputs,
      required this.itemModifyOutputs,
      required this.itemOutputs});
}

/// TODO: Describe the relationship between this and [EntriesList] sanely
class WeightedOutput {
  List<String> entryIds;
  double weight;

  WeightedOutput({required this.entryIds, required this.weight});
}

/// Describes the parameters for outputting a [Coin] from a [Recipe].
class CoinOutput {
  String? id;
  String coin;
  int count;

  CoinOutput({this.id, required this.coin, required this.count});
}

/// Describes the parameters by which a [Recipe] may modify an existing [Item].
class ItemModifyOutput {
  int itemInputRef;
  List<DoubleParam> doubles;
  List<LongParam> longs;
  List<StringParam> strings;
  int transferFee;

  ItemModifyOutput(
      {required this.itemInputRef,
      required this.doubles,
      required this.longs,
      required this.strings,
      required this.transferFee});
}

/// Describes the parameters by which a [Recipe] may generate a new [Item].
class ItemOutput {
  String? id;
  List<DoubleParam> doubles;
  List<LongParam> longs;
  List<StringParam> strings;
  int transferFee;

  ItemOutput(
      {this.id,
      required this.doubles,
      required this.longs,
      required this.strings,
      required this.transferFee});
}

/// TODO: describe this
class DoubleParam {
  String weight;
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

  DoubleWeightRange(
      {required this.upper, required this.lower, required this.weight});
}

/// TODO: describe this
class LongParam {
  int weight;
  String key;
  List<LongWeightRange> ranges;
  String program;

  LongParam(
      {required this.weight,
      required this.key,
      required this.ranges,
      required this.program});
}

/// TODO: describe this
class LongWeightRange {
  int upper;
  int lower;
  int weight;

  LongWeightRange(
      {required this.upper, required this.lower, required this.weight});
}

/// TODO: describe this
class StringParam {
  int weight;
  String key;
  String value;
  String program;

  StringParam(
      {required this.weight,
      required this.key,
      required this.value,
      required this.program});
}
