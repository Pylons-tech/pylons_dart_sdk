import 'package:mockito/mockito.dart';
import 'package:pylons_flutter/pylons_flutter.dart';

class MockWallet extends Mock implements PylonsWallet {
  List<Cookbook> cookbooks = [];
  List<Recipe> recipes = List.empty();
  List<Trade> trades = List.empty();

  /// Load the provided cookbooks. We'll use these to mock getCookbooks.
  void loadCookbooks(List<Cookbook> cbs) {
    cookbooks.addAll(cbs);
  }

  void loadRecipes(List<Recipe> rcps) {
    recipes.addAll(rcps);
  }

  void loadTrades(List<Trade> trade){
    trades.addAll(trade);
  }
}