/// Types and functionality for dealing with profiles.
library pylons_flutter_profile;

import 'package:pylons_flutter/features/data/models/item.dart';

/// A user profile that exists on a Pylons blockchain.
class Profile {
  String address;
  String name;
  Map<String, int> coins;
  List<Item> items;

  Profile(
      {required this.address,
      required this.name,
      required this.coins,
      required this.items});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      coins: Map<String, int>.from(json['coins'] as Map),
      address: json['address'],
      name: json['name'],
      items: [
        ...List.from(json['items']).map((e) => Item.fromJson(e)).toList()
      ],
    );
  }
}
