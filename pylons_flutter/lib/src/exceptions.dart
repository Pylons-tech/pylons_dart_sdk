library pylons_flutter_exceptions;

/// Exception thrown by TX-emitting API calls when a cookbook does not exist on
/// the chain.
class CookbookDoesNotExistException implements Exception {
  final String cookbook;
  final String errMsg;

  CookbookDoesNotExistException(c, e) :
        cookbook = c,
        errMsg = e;
}

/// Exception thrown by API calls when a profile does not exist on the chain.
class ProfileDoesNotExistException implements Exception {
  final String address;
  final String errMsg;

  ProfileDoesNotExistException(a) :
        address = a,
        errMsg = "The account does not exist on the chain.";
  ProfileDoesNotExistException.constructorWithMessage(a, e) :
        address = a,
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a profile is not in a valid
/// state for the execution of a recipe.
class ProfileStateException implements Exception {
  final String errMsg;

  ProfileStateException(e) :
        errMsg = e;
}

/// Exception thrown by TX-emitting API calls when a recipe does not exist on
/// the chain.
class RecipeDoesNotExistException implements Exception {
  final String cookbook;
  final String recipeName;
  final String recipeId;
  final String errMsg;

  RecipeDoesNotExistException(c, rN, e) :
      cookbook = c,
      recipeName = rN,
      recipeId = "",
      errMsg = e;

  RecipeDoesNotExistException.constructorWithRecipeID(r, e) :
        cookbook = "",
        recipeName = "",
        recipeId = r,
        errMsg = e;
}

class NodeInternalErrorException implements Exception {
  final int errorCode;
  final String nodeErrMsg;
  final String errMsg;

  NodeInternalErrorException(e, n, eM) :
      errorCode = e,
      nodeErrMsg = n,
      errMsg = eM;
}