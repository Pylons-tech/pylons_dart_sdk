import 'package:pylons_sdk/src/utils/query_helper.dart';

class StripeGeneratePaymentReceiptResponse {
  final bool success;
  final String purchaseID;
  final String processorName;
  final String payerAddr;
  final String amount;
  final String productID;
  final String signature;

  StripeGeneratePaymentReceiptResponse(
      {this.purchaseID = '',
      this.processorName = '',
      this.payerAddr = '',
      this.amount = '',
      this.productID = '',
      this.signature = '',
      this.success = false});

  factory StripeGeneratePaymentReceiptResponse.from(
      RequestResult<Map<String, dynamic>> ret) {
    if (ret.isSuccessful && ret.value != null) {
      return StripeGeneratePaymentReceiptResponse(
          productID: ret.value?.entries
              .firstWhere((entry) => entry.key == 'productID',
                  orElse: () => const MapEntry('productID', ''))
              .value as String,
          payerAddr: ret.value?.entries
              .firstWhere((entry) => entry.key == 'payerAddr',
                  orElse: () => const MapEntry('payerAddr', ''))
              .value as String,
          amount: ret.value?.entries
              .firstWhere((entry) => entry.key == 'amount',
                  orElse: () => const MapEntry('amount', ''))
              .value as String,
          signature: ret.value?.entries
              .firstWhere((entry) => entry.key == 'signature',
                  orElse: () => const MapEntry('signature', ''))
              .value as String,
          purchaseID: ret.value?.entries
              .firstWhere((entry) => entry.key == 'purchaseID',
                  orElse: () => const MapEntry('purchaseID', ''))
              .value as String,
          processorName: ret.value?.entries
              .firstWhere((entry) => entry.key == 'processorName',
                  orElse: () => const MapEntry('processorName', ''))
              .value as String,
          success: true);
    }
    return StripeGeneratePaymentReceiptResponse();
  }

  Map<String, dynamic> toJson() => {
        'purchaseID': purchaseID,
        'processorName': processorName,
        'payerAddr': payerAddr,
        'amount': amount,
        'productID': productID,
        'signature': signature
      };
}
