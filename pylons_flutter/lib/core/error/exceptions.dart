/// Exception thrown by TX-emitting API calls when a cookbook already exists
/// on chain while we're trying to create it.
class CookbookAlreadyExistsException implements Exception {
  final String cookbook;
  final String cookbookSender;
  final String errMsg;

  CookbookAlreadyExistsException(c, s, e)
      : cookbook = c,
        cookbookSender = s,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a cookbook does not exist on
/// the chain.
class CookbookDoesNotExistException implements Exception {
  final String cookbook;
  final String errMsg;

  CookbookDoesNotExistException(c, e)
      : cookbook = c,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a cookbook cannot be modified
/// or a recipe cannot be created by the active profile because the cookbook is
/// owned by a different one.
class CookbookNotOwnedException implements Exception {
  final String cookbook;
  final String cbSender;
  final String errMsg;

  CookbookNotOwnedException(c, s, e)
      : cookbook = c,
        cbSender = s,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when an item to be used in
/// executing a recipe or creating a trade is not owned by the active profile.
class ItemNotOwnedException implements Exception {
  final String item;
  final String itemOwner;
  final String errMsg;

  ItemNotOwnedException(i, o, e)
      : item = i,
        itemOwner = o,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a provided payment ID does
/// not exist or is not correct for the purchase being made.
class PaymentNotValidException implements Exception {
  final String paymentId;
  final String errMsg;

  PaymentNotValidException(p, e)
      : paymentId = p,
        errMsg = e;
}

/// Exception thrown by API calls when a profile does not exist on the chain.
class ProfileDoesNotExistException implements Exception {
  final String address;
  final String errMsg;

  ProfileDoesNotExistException(a)
      : address = a,
        errMsg = "The account does not exist on the chain.";

  ProfileDoesNotExistException.constructorWithMessage(a, e)
      : address = a,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a profile is not in a valid
/// state for the execution of a recipe.
class ProfileStateException implements Exception {
  final String errMsg;

  ProfileStateException(e) : errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a recipe already exists
/// on chain at the coordinates one is trying to be created at.
class RecipeAlreadyExistsException implements Exception {
  final String cookbook;
  final String recipeName;
  final String recipeId;
  final String errMsg;

  RecipeAlreadyExistsException(c, rN, e)
      : cookbook = c,
        recipeName = rN,
        recipeId = "",
        errMsg = e;

  RecipeAlreadyExistsException.constructorWithRecipeID(r, e)
      : cookbook = "",
        recipeName = "",
        recipeId = r,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a recipe does not exist on
/// the chain.
class RecipeDoesNotExistException implements Exception {
  final String cookbook;
  final String recipeName;
  final String recipeId;
  final String errMsg;

  RecipeDoesNotExistException(c, rN, e)
      : cookbook = c,
        recipeName = rN,
        recipeId = "",
        errMsg = e;

  RecipeDoesNotExistException.constructorWithRecipeID(r, e)
      : cookbook = "",
        recipeName = "",
        recipeId = r,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a recipe cannot be modified
/// by the active profile because it's owned by a different one.
class RecipeNotOwnedException implements Exception {
  final String cookbook;
  final String recipeName;
  final String recipeId;
  final String recipeSender;
  final String errMsg;

  RecipeNotOwnedException(c, rN, rI, s, e)
      : cookbook = c,
        recipeName = rN,
        recipeId = rI,
        recipeSender = s,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a recipe is not in a valid
/// state for the operation that the transaction attempted to perform.
class RecipeStateException implements Exception {
  final String cookbook;
  final String recipeName;
  final String recipeId;
  final String errMsg;

  RecipeStateException(c, rN, rI, e)
      : cookbook = c,
        recipeName = rN,
        recipeId = rI,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a recipe fails the sanity
/// check performed before the transaction is generated.
class RecipeValidationException implements Exception {
  final String cookbook;
  final String recipeName;
  final String recipeId;
  final String errMsg;

  RecipeValidationException(c, rN, rI, e)
      : cookbook = c,
        recipeName = rN,
        recipeId = rI,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when the Pylons node has an
/// internal error during processing of the emitted TX. If this occurs in
/// production environments, that's a problem.
class NodeInternalErrorException implements Exception {
  final int errorCode;
  final String nodeErrMsg;
  final String errMsg;

  NodeInternalErrorException(e, n, eM)
      : errorCode = e,
        nodeErrMsg = n,
        errMsg = eM;
}
