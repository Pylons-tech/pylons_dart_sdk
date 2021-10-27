import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/src/features/helper/dec_string.dart';

void main() {
  test('string to dec', () {
    assert(DecString.doubleFromDecString('100000000000000000') == 1);
    assert(DecString.doubleFromDecString('10000000000000000') == 0.1);
    assert(DecString.doubleFromDecString('1000000000000000') == 0.01);
    assert(DecString.doubleFromDecString('1') == 0.00000000000000001);
  });
  test('dec to string', () {
    assert(DecString.decStringFromDouble(1) == '100000000000000000');
    assert(DecString.decStringFromDouble(0.1) == '10000000000000000');
    assert(DecString.decStringFromDouble(0.01) == '1000000000000000');
    assert(DecString.decStringFromDouble(0.00000000000000001) == '1');
  });
}