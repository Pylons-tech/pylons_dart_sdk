/// Types and functionality for dealing with profiles.
library pylons_flutter_profile;

import 'package:pylons_sdk/src/generated/pylons/item.pb.dart';

/// Object representing a user profile that exists on a Pylons blockchain.
///
/// Note that the SDK-provided profile type does not directly mirror any type that exists on chain.
/// Multiple queries must be made to compose one of these objects. This is not normally relevant to
/// client applications, but may matter if you're trying to do anything too low-level.
class Profile {
  String address;
  String name;
  Map<String, int> coins;
  List<Item> items;

  Profile({required this.address, required this.name, required this.coins, required this.items});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      coins: Map<String, int>.from(json['coins'] as Map),
      address: json['address'],
      name: json['name'],
      items: [...List.from(json['items']).map((e) => Item.fromJson(e)).toList()],
    );
  }
}
