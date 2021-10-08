import 'package:bitstream/bitstream.dart';

import 'dart:typed_data';

class Bech32Data {
  final String hrp;
  final Int8List data;

  Bech32Data(this.hrp, this.data);
}

class UnencodedBech32Data {
  final String hrp;
  final Int8List data;

  UnencodedBech32Data(this.hrp, this.data);
}

/// Implements Bech32 encoding.
///
/// Cosmos' Bech32 code behaves slightly Wrong (tbd: confirm what the Wrong-ness is, I remember that it's a thing and
/// it's why we have this, but not what it was) which is why we have to have our own implementation.
class Bech32Cosmos {
  /// The Bech32 character set for encoding.
  static const CHARSET = 'qpzry9x8gf2tvdw0s3jn54khce6mua7l';

  /// The Bech32 character set for decoding.
  /// TODO: can we get dart format to let us format this sanely, or should we move it into another file?
  static const CHARSET_REV = <int>[
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    15,
    -1,
    10,
    17,
    21,
    20,
    26,
    30,
    7,
    5,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    29,
    -1,
    24,
    13,
    25,
    9,
    8,
    23,
    -1,
    18,
    22,
    31,
    27,
    19,
    -1,
    1,
    0,
    3,
    16,
    11,
    28,
    12,
    14,
    6,
    4,
    2,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    29,
    -1,
    24,
    13,
    25,
    9,
    8,
    23,
    -1,
    18,
    22,
    31,
    27,
    19,
    -1,
    1,
    0,
    3,
    16,
    11,
    28,
    12,
    14,
    6,
    4,
    2,
    -1,
    -1,
    -1,
    -1,
    -1
  ];

  /// Find the polynomial with value coefficients mod the generator as 30-bit.
  static int _polymod(Int8List values) {
    var c = 1;
    values.forEach((v_i) {
      var c0 = (c >> 25) & 0xff;
      c = c & 0x1ffffff << 5 ^ ((v_i) & 0xff);
      if (c0 & 1 != 0) c = c ^ 0x3b6a57b2;
      if (c0 & 2 != 0) c = c ^ 0x26508e6d;
      if (c0 & 4 != 0) c = c ^ 0x1ea119fa;
      if (c0 & 8 != 0) c = c ^ 0x3d4233dd;
      if (c0 & 16 != 0) c = c ^ 0x2a1462b3;
    });
    return c;
  }

  /// Expand a HRP for use in checksum computation.
  static Int8List _expandHrp(String hrp) {
    var hrpLength = hrp.length;
    var ret = Int8List(hrpLength * 2 + 1);
    for (var i = 0; i < hrpLength; i++) {
      var c = hrp.codeUnits[i] & 0x7f; // Limit to standard 7-bit ASCII
      ret[i] = ((c >> 5) & 0x07);
      ret[i + hrpLength + 1] = (c & 0x1f);
    }
    ret[hrpLength] = 0;
    return ret;
  }

  /// Verify a checksum.
  static bool _verifyChecksum(String hrp, Int8List values) {
    var hrpExpanded = _expandHrp(hrp);
    var combined = Int8List(hrpExpanded.length + values.length);
    combined.setRange(0, hrpExpanded.length, hrpExpanded);
    combined.setRange(
        hrpExpanded.length, values.length + hrpExpanded.length, values);
    return _polymod(combined) == 1;
  }

  /// Create a checksum.
  static Int8List _createChecksum(String hrp, Int8List values) {
    var hrpExpanded = _expandHrp(hrp);
    var enc = Int8List(hrpExpanded.length + values.length + 6);
    enc.setRange(0, hrpExpanded.length, hrpExpanded);
    enc.setRange(
        hrpExpanded.length, values.length + hrpExpanded.length, values);

    var mod = _polymod(enc) ^ 1;
    var ret = Int8List(6);
    for (var i = 0; i < 6; i++) {
      ret[i] = ((mod >> (5 * (5 - i))) & 31);
    }
    return ret;
  }

  /// Encodes a Bech32 string.
  static String encodeData(Bech32Data bech32) {
    return encode(bech32.hrp, bech32.data);
  }

  /// Encodes a Bech32 string.
  static String encode(String humanReadablePart, Int8List data) {
    var hrp = humanReadablePart;

    // todo: these should have a catchable exception type
    if (hrp.isEmpty) throw Exception('Human-readable part is too short');
    if (hrp.length > 83) throw Exception('Human-readable part is too long');

    hrp = hrp.toLowerCase();
    var checksum = _createChecksum(hrp, data);
    var combined = Int8List(data.length + checksum.length);
    combined.setRange(0, data.length, data);
    combined.setRange(data.length, data.length + checksum.length, checksum);

    var sb = StringBuffer(hrp.length + 1 + combined.length);
    sb.write(hrp);
    sb.write('1');
    combined.forEach((b) {
      sb.write(CHARSET[b.toInt()]);
    });
    return sb.toString();
  }

  /// Decodes a Bech32 string.
  static Bech32Data decode(String str) {
    var lower = false;
    var upper = false;
    // todo: as above, these need catchable exceptions
    if (str.length < 8) {
      throw Exception('Input too short: ${str.length}');
    }
    if (str.length > 90) {
      throw Exception('Input too long: ${str.length}');
    }
    for (var i = 0; i < str.length; i++) {
      var c = str[i];
      var codePoint = str.codeUnitAt(i);
      // todo: as above, needs catchable exception
      if (str.codeUnits[i] < 33 || str.codeUnits[i] > 126) {
        throw Exception('Invalid character $c at position $i');
      }
      if (codePoint >= 0x61 && codePoint < 0x7b) {
        // 0x61 == a, 0x7a == z
        // todo: as above, needs catchable exception
        if (upper) throw Exception('Invalid character $c at position $i');
        lower = true;
      }
      if (codePoint >= 0x41 && codePoint < 0x5b) {
        // 0x41 == A, 0x5a == Z
        if (lower) throw Exception('Invalid character $c at position $i');
        upper = true;
      }
    }
    var pos = str.lastIndexOf('1');
    // todo: as above, needs catchable exception
    if (pos < 1) throw Exception('Missing human-readable part');
    var dataPartLength = str.length - 1 - pos;
    // todo: as above, needs catchable exception
    if (dataPartLength < 6) {
      throw Exception('Data part too short: $dataPartLength');
    }
    var values = Int8List(dataPartLength);
    for (var i = 0; i < dataPartLength; i++) {
      var c = str[i + pos + 1];
      var codePoint = str.codeUnitAt(i + pos + 1);
      // todo: as above, needs catchable exception
      if (CHARSET_REV[codePoint] == -1) {
        throw Exception('Invalid character $c at position $i + post + 1');
      }
      values[i] = CHARSET_REV[codePoint];
    }
    var hrp = str.substring(0, pos).toLowerCase();
    // todo: as above, needs catchable exception
    if (!_verifyChecksum(hrp, values)) throw Exception('Invalid checksum');
    return Bech32Data(hrp, values.sublist(0, values.length - 6));
  }

  /// Converts a ByteArray where each byte encodes fromBits bits to one where each byte
  /// encodes toBits bits. Ported from btcutil Go implementation; see
  /// https://github.com/btcsuite/btcutil/blob/master/bech32/bech32.go
  ///
  /// This does a lot of conversions, which isn't terribly efficient, but we want
  /// to guarantee correct behavior in the event of overflow.
  static Int8List convertBits(
      Int8List data, int fromBits, int toBits, bool pad) {
    var acc = 0;
    var bits = 0;
    var out = BitStream();
    final maxv = (1 << toBits) - 1;
    final max_acc = (1 << (fromBits + toBits - 1)) - 1;
    for (var i = 0; i < data.length; i++) {
      var value = data[i] & 0xff;
      if ((value >>> fromBits) != 0) {
        // todo: as above, needs catchable exception
        throw Exception('Input value $value exceeds $fromBits bit size');
      }
      acc = ((acc << fromBits) | value) & max_acc;
      bits += fromBits;
      // I'm not sure this is correct, so if there's a problem with this function, look here.
      while (bits >= toBits) {
        bits -= toBits;
        out.write((acc >>> bits) & maxv);
      }
    }
    if (pad) {
      if (bits > 0) {
        out.write((acc << (toBits - bits)) & maxv);
      }
    } else if (bits >= fromBits || ((acc << (toBits - bits)) & maxv) != 0) {
      // todo: as above, needs catchable exception
      throw Exception('Could not convert bits, invalid padding');
    }
    // This should work, but we do have to go from uint to int, so note this as potentially suspect.
    return out.getStream().buffer.asInt8List();
  }

  /// Tendermint bech32 helper.
  /// Converts from a base64 encoded byte string to base32 encoded byte string and then to bech32
  static String convertAndEncode(String hrp, Int8List data) {
    var converted = convertBits(data, 8, 5, true);
    return encode(hrp, converted);
  }

  /// Tendermint bech32 helper.
  /// Decodes a bech32 encoded string and converts to base64 encoded bytes
  static UnencodedBech32Data decodeAndConvert(String bech) {
    var data = decode(bech);
    var converted = convertBits(data.data, 5, 8, false);
    return UnencodedBech32Data(data.hrp, converted);
  }
}
