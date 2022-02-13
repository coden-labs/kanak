

import 'package:kanak_flutter/data_types/currency_value.dart';
import 'package:kanak_flutter/models/account.dart';
import 'package:kanak_flutter/models/asset.dart';
import 'package:uuid/uuid.dart';

class Transaction {
  Uuid? transactionId;

  Asset? debitAsset;
  CurrencyValue debitAmount = CurrencyValue(0);
  Account? debitAccount;

  Asset? creditAsset;
  CurrencyValue creditAmount = CurrencyValue(0);
  Account? creditAccount;

  CurrencyValue transactionCharge = CurrencyValue(0);
  Asset? transactionAsset;

}