/// Types and functionality for dealing with cookbooks.
library pylons_flutter_cookbook;

/// A cookbook that exists (or can exist) on the Pylons chain, in which recipes
/// can be created.
class Cookbook {
  String? id;
  String nodeVersion;
  String name;
  String description;
  String version;
  String developer;
  String sender;
  String supportEmail;
  int costPerBlock;

<<<<<<< HEAD
  Cookbook({required this.nodeVersion, required this.id, required this.name, required this.description, required this.version,
    required this.developer, required this.sender, required this.supportEmail, required this.costPerBlock});
=======
  Cookbook(
      {this.id,
      required this.nodeVersion,
      required this.name,
      required this.description,
      required this.version,
      required this.developer,
      required this.sender,
      required this.supportEmail,
      required this.costPerBlock});
>>>>>>> pre-comms-fixes

  /// Takes a [String] app name and generates an auto-cookbook for the provided app name.
  /// An auto-cookbook is just a normal cookbook; values are auto-generated for
  /// its fields using the app name. Useful mainly in applications that need to
  /// transparently generate new cookbooks at runtime.
  ///
  /// Returns a [Cookbook].
  static Cookbook auto(String appName) {
    throw UnimplementedError();
  }

<<<<<<< HEAD
  factory Cookbook.fromJson(Map<String, dynamic> json ) {
    return Cookbook(supportEmail: json['supportEmail'], name: json['name'], description: json['description'], costPerBlock: json['costPerBlock'], nodeVersion: json['nodeVersion'], sender: json['sender'], version: json['version'], developer: json['developer'], id: json['id']);
=======
  factory Cookbook.fromJson(Map<String, dynamic> json) {
    return Cookbook(
      nodeVersion: json['nodeVersion'],
      version: json['version'],
      supportEmail: json['supportEmail'],
      name: json['name'],
      costPerBlock: json['costPerBlock'],
      description: json['description'],
      sender: json['sender'],
      developer: json['developer'],
    );
>>>>>>> pre-comms-fixes
  }
}
