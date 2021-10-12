import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/core/bech32_cosmos.dart';
import 'package:pylons_flutter/core/error/exceptions.dart';
import 'package:bit_array/bit_array.dart';
import 'package:crypto/crypto.dart';
import 'package:collection/collection.dart';

class _TestConfig {
  final String str;
  final bool valid;

  _TestConfig(this.str, this.valid);
}

void main() {
  // Port from btcutil bech32_test.go
  // (https://github.com/btcsuite/btcutil/blob/master/bech32/bech32_test.go)
  group('Core Bech32 tests', ()
  {
    test('Go through the big test array. (This can be refactored to be dartier at a later date.)', () {
      final tests = [
        _TestConfig('A12UEL5L', true,),
        _TestConfig('an83characterlonghumanreadablepartthatcontainsthenumber1andtheexcludedcharactersbio1tt5tgs', true),
        _TestConfig('abcdef1qpzry9x8gf2tvdw0s3jn54khce6mua7lmqqqxw', true),
        _TestConfig('11qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqc8247j', true),
        _TestConfig('split1checkupstagehandshakeupstreamerranterredcaperred2y9e3w', true),
        _TestConfig('split1checkupstagehandshakeupstreamerranterredcaperred2y9e2w', false), // invalid checksum
        _TestConfig('s lit1checkupstagehandshakeupstreamerranterredcaperredp8hs2p', false), // invalid character (space) in hrp
        _TestConfig('spl${const AsciiDecoder().convert(Uint8List(127))}t1checkupstagehandshakeupstreamerranterredcaperred2y9e3w', false), // invalid character (DEL) in hrp
        _TestConfig('split1cheo2y9e2w', false), // invalid character (o) in data part
        _TestConfig('split1a2y9w', false), // too short data part
        _TestConfig('1checkupstagehandshakeupstreamerranterredcaperred2y9e3w', false), // empty hrp
        _TestConfig('11qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqsqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqc8247j', false) // too long
      ];

      for (var test in tests) {
        var str = test.str;
        if (!test.valid) {
          // Invalid string decoding should result in error.
          expect(() => Bech32Cosmos.decode(str), throwsA(isA<AddressFormatException>()),
              reason: 'Expected decoding to fail for invalid string $str');
          continue;
        }

        // Valid string decoding should result in no error.
        late Bech32Data data;
        expect(() => data = Bech32Cosmos.decode(str), returnsNormally,
            reason: 'Expected string to be valid bech32: $str');

        // Check that it encodes to the same string
        late String encoded;
        expect(() => encoded = Bech32Cosmos.encode(data.hrp, data.data), returnsNormally,
            reason: 'Encoding failed: $str');

        assert(str.toLowerCase() == encoded, 'Expected data to encode to $str but got $encoded');


        // Flip a bit in the string and make sure it is caught.
        var pos = str.lastIndexOf('1');
        var bits = BitArray.fromUint8List(Uint8List.fromList([str.codeUnitAt(pos + 1)]));
        bits.invertBit(0);
        var flippedChar = const AsciiDecoder().convert(bits.byteBuffer.asUint8List());
        var flipped = str.substring(0, pos + 1) + flippedChar + str.substring(pos + 2);
        expect(() => Bech32Cosmos.decode(flipped), throwsException,
            reason: 'Expected decoding to fail');
      }
    });
  });

   // Port from tendermint bech32_test.go
   // (https://github.com/tendermint/tendermint/blob/master/libs/bech32/bech32_test.go)
  group('Tendermint helper tests', () {
    test('Test encode-and-convert/decode-and-convert', () {
      var sum = Int8List.fromList(sha256.convert(const AsciiEncoder().convert('hello world\n')).bytes);
      late String bech;
      expect(() => bech = Bech32Cosmos.convertAndEncode("shasum", sum), returnsNormally,
          reason: 'Failed convert-and-encode operation');

      late UnencodedBech32Data data;
      expect(() => data = Bech32Cosmos.decodeAndConvert(bech), returnsNormally,
          reason: 'Failed decode-and-convert operation');


      assert('shasum' == data.hrp, 'Invalid hrp (got ${data.hrp})');
      assert(const ListEquality().equals(sum, data.data), 'Invalid decode');
    });
  });
}