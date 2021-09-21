/// Types and functionality for dealing with profiles.
library pylons_flutter_profile;

import 'package:pylons_flutter/pylons_flutter.dart';

/// A user profile that exists on a Pylons blockchain.
class Profile {
  String address;
  String name;
  Map<String, int> coins;
  List<Item> items;

  Profile(this.address, this.name, this.coins, this.items);
}
