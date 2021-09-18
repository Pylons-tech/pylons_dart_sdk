library pylons_flutter_cookbook;

/// A cookbook that exists (or can exist) on the Pylons chain, in which recipes
/// can be created.
class Cookbook {
  String nodeVersion;
  String id;
  String name;
  String description;
  String version;
  String developer;
  String sender;
  String supportEmail;
  int costPerBlock;

  Cookbook(this.nodeVersion, this.id, this.name, this.description, this.version,
      this.developer, this.sender, this.supportEmail, this.costPerBlock);

  /// Takes a [String] app name and generates an auto-cookbook for the provided app name.
  /// An auto-cookbook is just a normal cookbook; values are auto-generated for
  /// its fields using the app name. Useful mainly in applications that need to
  /// transparently generate new cookbooks at runtime.
  ///
  /// Returns a [Cookbook].
  static Cookbook auto(String appName) {
    throw UnimplementedError();
  }
}
