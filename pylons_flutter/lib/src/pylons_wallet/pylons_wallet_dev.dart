import 'package:dartz/dartz.dart';

import '../../pylons_flutter.dart';





/// The Pylons class is used for the test net .
class PylonsWalletDevImpl implements PylonsWallet {
  @override
  Future<List<Cookbook>> getCookbooks() {
    // TODO: implement getCookbooks
    throw UnimplementedError();
  }

  @override
  Future<Profile> getProfile(String? address) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<List<Recipe>> getRecipes(String? address) {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }

  @override
  Future<List<Trade>> getTrades() {
    // TODO: implement getTrades
    throw UnimplementedError();
  }

  @override
  Future<String> sendMessage(List<String> msg) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<Transaction, Profile>> txBuyItem(String tradeId, String paymentId) {
    // TODO: implement txBuyItem
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<Transaction, Profile>> txBuyPylons(int pylons, String paymentId) {
    // TODO: implement txBuyPylons
    throw UnimplementedError();
  }

  @override
  Future<Tuple3<Transaction, Profile, Cookbook>> txCreateCookbook(Cookbook cookbook) {
    // TODO: implement txCreateCookbook
    throw UnimplementedError();
  }

  @override
  Future<Tuple3<Transaction, Profile, Recipe>> txCreateRecipe(Recipe recipe) {
    // TODO: implement txCreateRecipe
    throw UnimplementedError();
  }

  @override
  Future<Transaction> txDisableRecipe(String recipeId) {
    // TODO: implement txDisableRecipe
    throw UnimplementedError();
  }

  @override
  Future<Transaction> txEnableRecipe(String recipeId) {
    // TODO: implement txEnableRecipe
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<Transaction, Profile>> txExecuteRecipe(String cookbookId, String recipeName, List<String> itemIds) {
    // TODO: implement txExecuteRecipe
    throw UnimplementedError();
  }

  @override
  Future<Tuple3<Transaction, Profile, Trade>> txPlaceForSale(Item item, int price) {
    // TODO: implement txPlaceForSale
    throw UnimplementedError();
  }

  @override
  Future<Tuple3<Transaction, Profile, Cookbook>> txUpdateCookbook(Cookbook cookbook) {
    // TODO: implement txUpdateCookbook
    throw UnimplementedError();
  }

  @override
  Future<Tuple3<Transaction, Profile, Recipe>> txUpdateRecipe(Recipe recipe) {
    // TODO: implement txUpdateRecipe
    throw UnimplementedError();
  }

  @override
  Future<bool> exists() {
    // TODO: implement exists
    throw UnimplementedError();
  }

  @override
  void startIPC() {
    // TODO: implement startIPC
  }



}
