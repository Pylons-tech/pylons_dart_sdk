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


  getHostBasedOnOsTest();
  createLinkBasedOnOS();
  getCookBookTest();
  getProfileTest();
  getRecipesTest();
  createCookBookTest();
  executeRecipeTest();
}

void executeRecipeTest() {
  test('should execute recipe in the wallet', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var channel = const MethodChannel('plugins.flutter.io/url_launcher');

    // Register the mock handler.
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'canLaunch') {
        return true;
      }
      return null;
    });

    var host = MOCK_HOST;

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);


    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_EXECUTE_RECIPE);
      responseCompleters[Strings.TX_EXECUTE_RECIPE]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.txExecuteRecipe( paymentInfo: [], recipeName: MOCK_RECIPE_ID, cookbookId: MOCK_COOKBOOK_ID, itemIds: [], coinInputIndex: 0);

    expect(true, response.success);
    expect(response.action, Strings.TX_EXECUTE_RECIPE);
  });

}

void createCookBookTest() {
  test('should create cookbook in the wallet', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var channel = const MethodChannel('plugins.flutter.io/url_launcher');

    // Register the mock handler.
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'canLaunch') {
        return true;
      }
      return null;
    });

    var host = MOCK_HOST;

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);

    var cookBook = Cookbook.create()..mergeFromProto3Json(jsonDecode(MOCK_COOKBOOK));

    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_CREATE_COOKBOOK);
      responseCompleters[Strings.TX_CREATE_COOKBOOK]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.txCreateCookbook(cookBook);

    expect(true, response.success);
    expect(response.action, Strings.TX_CREATE_COOKBOOK);
  });
}

void getRecipesTest() {
  test('should get profile from the wallet', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var channel = const MethodChannel('plugins.flutter.io/url_launcher');

    // Register the mock handler.
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'canLaunch') {
        return true;
      }
      return null;
    });

    var host = MOCK_HOST;

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      final sdkResponse = SDKIPCResponse<List<Recipe>>(success: true, error: '', data: [Recipe()..createEmptyInstance(), Recipe()..createEmptyInstance()], errorCode: '', action: Strings.GET_RECIPES);
      responseCompleters[Strings.GET_RECIPES]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getRecipes(MOCK_COOKBOOK_ID);

    expect(response.data.length, 2);
    expect(response.action, Strings.GET_RECIPES);
  });
}

void getProfileTest() {
  test('should get profile from the wallet', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var channel = const MethodChannel('plugins.flutter.io/url_launcher');

    // Register the mock handler.
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'canLaunch') {
        return true;
      }
      return null;
    });

    var host = MOCK_HOST;

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: host, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: MOCK_USERNAME, errorCode: '', action: Strings.GET_PROFILE);
      responseCompleters[Strings.GET_PROFILE]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getProfile();

    expect(response.data, MOCK_USERNAME);
    expect(response.action, Strings.GET_PROFILE);
  });
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

    var host = MOCK_HOST;

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
