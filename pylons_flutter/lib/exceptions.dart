library pylons_flutter;

/// Exception thrown when getProfile is unable to retrieve a profile
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