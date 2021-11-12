/// Types and functionality for dealing with transactions.
library pylons_flutter_transaction;

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:pylons_flutter/src/generated/cosmos/tx/v1beta1/tx.pb.dart';
import 'package:pylons_flutter/src/generated/pylons/tx.pb.dart';

/// The Transaction class wraps a native Cosmos [Tx] type, as used by the Pylons node,
/// and extracts Pylons messages into strongly-typed lists to facilitate more idiomatic
/// Dart code.
class Transaction {
  Tx nativeTx;
  IList<MsgCancelTrade> msgs_CancelTrade;
  IList<MsgCompleteExecutionEarly> msgs_CompleteExecutionEarly;
  IList<MsgCreateAccount> msgs_CreateAccount;
  IList<MsgCreateCookbook> msgs_CreateCookbook;
  IList<MsgCreateRecipe> msgs_CreateRecipe;
  IList<MsgCreateTrade> msgs_CreateTrade;
  IList<MsgExecuteRecipe> msgs_ExecuteRecipe;
  IList<MsgFulfillTrade> msgs_FulfillTrade;
  IList<MsgGoogleInAppPurchaseGetCoins> msgs_GoogleInAppPurchaseGetCoins;
  IList<MsgSendItems> msgs_SendItems;
  IList<MsgSetItemString> msgs_SetItemString;
  IList<MsgTransferCookbook> msgs_TransferCookbook;
  IList<MsgUpdateAccount> msgs_UpdateAccount;
  IList<MsgUpdateCookbook> msgs_UpdateCookbook;
  IList<MsgUpdateRecipe> msgs_UpdateRecipe;

  /// Generate a new [Transaction] wrapping the provides [Tx].
  factory Transaction.wrap(Tx tx) {
    final List<MsgCancelTrade> cancelTrade = [];
    final List<MsgCompleteExecutionEarly> completeExecutionEarly = [];
    final List<MsgCreateAccount> createAccount = [];
    final List<MsgCreateCookbook> createCookbook = [];
    final List<MsgCreateRecipe> createRecipe = [];
    final List<MsgCreateTrade> createTrade = [];
    final List<MsgExecuteRecipe> executeRecipe = [];
    final List<MsgFulfillTrade> fulfillTrade = [];
    final List<MsgGoogleInAppPurchaseGetCoins> googleInAppPurchaseGetCoins = [];
    final List<MsgSendItems> sendItems = [];
    final List<MsgSetItemString> setItemString = [];
    final List<MsgTransferCookbook> transferCookbook = [];
    final List<MsgUpdateAccount> updateAccount = [];
    final List<MsgUpdateCookbook> updateCookbook = [];
    final List<MsgUpdateRecipe> updateRecipe = [];

    for (var msg in tx.body.messages) {
      switch (msg.typeUrl) {
        case '/Pylonstech.pylons.pylons.MsgCancelTrade':
          {
            cancelTrade.add(msg.unpackInto(MsgCancelTrade()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgCompleteExecutionEarly':
          {
            completeExecutionEarly
                .add(msg.unpackInto(MsgCompleteExecutionEarly()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgCreateAccount':
          {
            createAccount.add(msg.unpackInto(MsgCreateAccount()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgCreateCookbook':
          {
            createCookbook.add(msg.unpackInto(MsgCreateCookbook()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgCreateRecipe':
          {
            createRecipe.add(msg.unpackInto(MsgCreateRecipe()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgCreateTrade':
          {
            createTrade.add(msg.unpackInto(MsgCreateTrade()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgExecuteRecipe':
          {
            executeRecipe.add(msg.unpackInto(MsgExecuteRecipe()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgFulfillTrade':
          {
            fulfillTrade.add(msg.unpackInto(MsgFulfillTrade()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgGoogleInAppPurchaseGetCoins':
          {
            googleInAppPurchaseGetCoins
                .add(msg.unpackInto(MsgGoogleInAppPurchaseGetCoins()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgSendItems':
          {
            sendItems.add(msg.unpackInto(MsgSendItems()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgSetItemString':
          {
            setItemString.add(msg.unpackInto(MsgSetItemString()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgTransferCookbook':
          {
            transferCookbook.add(msg.unpackInto(MsgTransferCookbook()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgUpdateAccount':
          {
            updateAccount.add(msg.unpackInto(MsgUpdateAccount()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgUpdateCookbook':
          {
            updateCookbook.add(msg.unpackInto(MsgUpdateCookbook()));
            break;
          }
        case '/Pylonstech.pylons.pylons.MsgUpdateRecipe':
          {
            updateRecipe.add(msg.unpackInto(MsgUpdateRecipe()));
            break;
          }
      }
    }
    return Transaction(
        tx,
        IList.from(cancelTrade),
        IList.from(completeExecutionEarly),
        IList.from(createAccount),
        IList.from(createCookbook),
        IList.from(createRecipe),
        IList.from(createTrade),
        IList.from(executeRecipe),
        IList.from(fulfillTrade),
        IList.from(googleInAppPurchaseGetCoins),
        IList.from(sendItems),
        IList.from(setItemString),
        IList.from(transferCookbook),
        IList.from(updateAccount),
        IList.from(updateCookbook),
        IList.from(updateRecipe));
  }

  Transaction(
      this.nativeTx,
      this.msgs_CancelTrade,
      this.msgs_CompleteExecutionEarly,
      this.msgs_CreateAccount,
      this.msgs_CreateCookbook,
      this.msgs_CreateRecipe,
      this.msgs_CreateTrade,
      this.msgs_ExecuteRecipe,
      this.msgs_FulfillTrade,
      this.msgs_GoogleInAppPurchaseGetCoins,
      this.msgs_SendItems,
      this.msgs_SetItemString,
      this.msgs_TransferCookbook,
      this.msgs_UpdateAccount,
      this.msgs_UpdateCookbook,
      this.msgs_UpdateRecipe);
}

const int responseCodeOk = 0;
const int responseCodeError = -1;

/// Enumeration of possible states a [Transaction] can be in.
///
/// TODO: does this still make sense for us at all? at present, it's not actually in use
enum TxState { notYetSent, notYetAccepted, committed, refused }

extension TxStatePar on String {
  TxState toTxStateEnum() {
    return TxState.values.firstWhere(
        (e) => e.toString().toLowerCase() == 'TxState.$this'.toLowerCase(),
        orElse: () => TxState.notYetSent); //return null if not found
  }
}
