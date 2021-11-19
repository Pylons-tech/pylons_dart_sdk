import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pylons_sdk/pylons_sdk.dart';
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/ipc_constants.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_sdk/src/pylons_wallet/pylons_wallet_impl.dart';
import '../mocks/mock_constants.dart';
import '../mocks/mock_uni_link.dart';

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

  getHostBasedOnOsTest();
  createLinkBasedOnOS();
  getCookBookTest();
}

void getCookBookTest() {
  test('should get cookbook from the wallet', () async {
    TestWidgetsFlutterBinding.ensureInitialized();


    var channel = const MethodChannel('plugins.flutter.io/url_launcher');

    // Register the mock handler.
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'canLaunch') {
        return true;
      }
      return null;
    });

    var host = 'new_sdk';

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);

    var cookBook = Cookbook.create()..mergeFromProto3Json(jsonDecode(MOCK_COOKBOOK));

    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse<Cookbook>(success: true, error: '', data: cookBook, errorCode: '', action: Strings.GET_COOKBOOK);
      responseCompleters[Strings.GET_COOKBOOK]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getCookbook(MOCK_COOKBOOK_ID);

    expect(response.data.iD, MOCK_COOKBOOK_ID);
  });
}

void createLinkBasedOnOS() {
  group('createLinkBasedOnOS', () {
    var host = 'new_sdk';

    test('should return wallet link for android ', () {
      var expectedLink = '$BASE_UNI_LINK/';

      var uniLink = MockUniLinksPlatform();
      when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
      var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);

      var response = pylonsWallet.createLinkBasedOnOS(encodedMessage: '', isAndroid: true);
      expect(expectedLink, response);
    });

    test('should return wallet link for ios ', () {
      var expectedLink = '$BASE_UNI_LINK_IOS';

      var uniLink = MockUniLinksPlatform();
      when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
      var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);

      var response = pylonsWallet.createLinkBasedOnOS(encodedMessage: '', isAndroid: false);
      expect(expectedLink, response);
    });
  });
}

void getHostBasedOnOsTest() {
  group('getHostBasedOnOS', () {
    var host = 'new_sdk';

    test('should return host as platform in android ', () {
      var uniLink = MockUniLinksPlatform();
      when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
      var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);

      var hostBasedOnPlatform = pylonsWallet.getHostBasedOnOS(true);
      expect(host, hostBasedOnPlatform);
    });

    test('should return host as platform in ios ', () {
      var uniLink = MockUniLinksPlatform();
      when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));

      var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);

      var expectedHost = 'pylons-$host';

      var hostBasedOnPlatform = pylonsWallet.getHostBasedOnOS(false);
      expect(expectedHost, hostBasedOnPlatform);
    });
  });
}
