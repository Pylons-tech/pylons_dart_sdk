import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:pylons_flutter/src/core/constants/strings.dart';
import 'package:pylons_flutter/src/features/ipc/ipc_constants.dart';
import 'package:pylons_flutter/src/pylons_wallet/pylons_wallet_impl.dart';

import '../mocks/mock_constants.dart';

void main() {
  // group('test encodeMessage ', () {
  //   test('should encode cook book ', () {
  //     // Arrange
  //     var cookBook = Cookbook.fromJson(jsonDecode(MOCK_COOKBOOK));
  //     var key = Strings.TX_CREATE_COOKBOOK;
  //     var dataToEncode = [key, const JsonEncoder().convert(cookBook)];
  //     var pylonsWallet = PylonsWalletImpl(MOCK_HOST);
  //
  //     // Act
  //     var encodedMessage = pylonsWallet.encodeMessage(dataToEncode);
  //
  //     var decodedMessage = pylonsWallet.decodeMessage(encodedMessage);
  //
  //     // Assert
  //     expect(dataToEncode, decodedMessage);
  //   });
  // });
  //
  // group('cookbook', () {
  //   test('should check if the cookbook unilink was created successfuly or not ', () {
  //     TestWidgetsFlutterBinding.ensureInitialized();
  //
  //     const channel = MethodChannel('plugins.flutter.io/url_launcher');
  //
  //     var url = '';
  //
  //     channel.setMockMethodCallHandler((MethodCall methodCall) async {
  //       url = methodCall.arguments['url'];
  //       return true;
  //     });
  //
  //     // Arrange
  //     var cookBook = Cookbook.fromJson(jsonDecode(MOCK_COOKBOOK));
  //     var key = Strings.TX_CREATE_COOKBOOK;
  //     var dataToEncode = [key, const JsonEncoder().convert(cookBook)];
  //     var pylonsWallet = PylonsWalletImpl(MOCK_HOST);
  //
  //     var encodedMessage = pylonsWallet.encodeMessage(dataToEncode);
  //
  //     pylonsWallet.sendMessage(dataToEncode);
  //
  //     // Assert
  //
  //     expect(url, '$BASE_UNI_LINK/$encodedMessage');
  //   });
  // });
}
