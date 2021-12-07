import 'dart:convert';

import '../../../pylons_sdk.dart';

class ValidateRecipe {
  /// Verifies that all of a recipe's outputs are accessible, and that it
  /// doesn't refer to any outputs that are not present.
  static void validate(Recipe recipe) {
    if (recipe.name.length <= 8) {
      throwError(recipe, 'Recipe name should have more than 8 characters');
    }

    if (recipe.description.length <= 20) {
      throwError(recipe, 'Recipe description should have more than 20 characters');
    }

    if (recipe.cookbookID.isEmpty) {
      throwError(recipe, 'Invalid CookbookId');
    }

    if (recipe.iD.isEmpty) {
      throwError(recipe, 'Invalid Recipe ID');
    }

    if (recipe.itemInputs.where((e) => e.iD.isEmpty).toList().isNotEmpty) {
      throwError(recipe, 'Invalid Item ID');
    }

    if (costPerBlockIsEmpty(recipe)) {
      throwError(recipe, 'Cost Per Block is Empty');
    }

    var found = <String>[];
    var reFound = <String>[];
    var orphanOutputs = <String>[];
    var unknownOutputs = <String>[];
    for (var output in recipe.outputs) {
      for (var entry in output.entryIDs) {
        if (!found.contains(entry)) found.add(entry);
      }
    }
    for (var entryId in found) {
      for (var output in recipe.entries.coinOutputs) {
        if (found.contains(output.iD) && !reFound.contains(output.iD)) {
          reFound.add(output.iD);
        } else {
          orphanOutputs.add(output.iD);
        }
      }
      for (var output in recipe.entries.itemOutputs) {
        if (found.contains(output.iD) && !reFound.contains(output.iD)) {
          reFound.add(output.iD);
        } else {
          orphanOutputs.add(output.iD);
        }
      }
      if (!reFound.contains(entryId)) unknownOutputs.add(entryId);
    }
    if (unknownOutputs.isNotEmpty || orphanOutputs.isNotEmpty) {
      throw RecipeValidationException(
          recipe.cookbookID,
          recipe.name,
          recipe.iD,
          'Recipe validation failed\nUnknown entry ids:\n\n'
          '${const JsonEncoder().convert(unknownOutputs)}\n\n'
          'Orphaned entries:\n\n'
          '${const JsonEncoder().convert(orphanOutputs)}');
    }
  }

  static bool costPerBlockIsEmpty(Recipe recipe) => !(recipe.costPerBlock.hasAmount() && recipe.costPerBlock.hasDenom());

  static void throwError(Recipe recipe, String error) {
    throw RecipeValidationException(recipe.cookbookID, recipe.name, recipe.iD, error);
  }
}
