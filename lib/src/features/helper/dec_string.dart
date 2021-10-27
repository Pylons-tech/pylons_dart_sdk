library pylons_flutter_dec_string;

/// Very rough compatibility functions for cosmos decimal types.
/// TODO: This is a temporary solution to make working w/ decimals a little more tolerable,
/// but we should actually port the Cosmos decimal type over properly
class DecString {
  static const PRECISION = 18;
  static const MAX = 999999999999999999;
  static const ONE = 100000000000000000.0;

  static String decStringFromDouble (double f) {
    return (f * ONE).toStringAsPrecision(PRECISION).split('.').first;
  }

  static double doubleFromDecString (String f) {
    var i = int.parse(f);
    if (i > MAX) {
      throw Exception('$i requires more than $PRECISION places of precision');
    }
    return i / ONE;
  }
}