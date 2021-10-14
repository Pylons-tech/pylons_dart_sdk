class Cookbook {
  String creator;
  String iD;
  String name;
  String nodeVersion;
  String description;
  String developer;
  String version;
  String supportEmail;
  CostPerBlock costPerBlock;
  bool enabled;

  Cookbook(
      {required this.creator,
      required this.iD,
      required this.name,
      required this.nodeVersion,
      required this.description,
      required this.developer,
      required this.version,
      required this.supportEmail,
      required this.costPerBlock,
      required this.enabled});

  factory Cookbook.fromJson(Map<String, dynamic> json) {
    return Cookbook(
        iD: json['ID'],
        creator: json['creator'],
        developer: json['developer'],
        description: json['description'],
        name: json['name'],
        version: json['version'],
        costPerBlock: CostPerBlock.fromJson(json['costPerBlock']),
        enabled: json['enabled'],
        nodeVersion: json['nodeVersion'],
        supportEmail: json['supportEmail']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['creator'] = creator;
    data['ID'] = iD;
    data['name'] = name;
    data['nodeVersion'] = nodeVersion;
    data['description'] = description;
    data['developer'] = developer;
    data['version'] = version;
    data['supportEmail'] = supportEmail;
    data['costPerBlock'] = costPerBlock.toJson();
    data['enabled'] = enabled;
    return data;
  }
}

class CostPerBlock {
  String denom;
  String amount;

  CostPerBlock({required this.denom, required this.amount});

  factory CostPerBlock.fromJson(Map<String, dynamic> json) {
    return CostPerBlock(amount: json['amount'], denom: json['denom']);
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['denom'] = denom;
    data['amount'] = amount;
    return data;
  }
}
