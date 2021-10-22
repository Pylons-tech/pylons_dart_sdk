import 'package:mockito/mockito.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

class MockWallet extends Mock implements PylonsWallet {
  bool _exists;
  List<Cookbook> cookbooks = [];
  List<Recipe> recipes = [];
  List<Trade> trades = [];

  MockWallet(bool exists) {
    _exists = exists;
  }

  /// Load the provided cookbooks. We'll use these to mock getCookbooks.
  void loadCookbooks(List<Cookbook> cbs) {
    cookbooks.addAll(cbs);
  }

  void loadRecipes(List<Recipe> rcps) {
    recipes.addAll(rcps);
  }

  void loadTrades(List<Trade> trade) {
    trades.addAll(trade);
  }
}
