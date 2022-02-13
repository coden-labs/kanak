import 'package:kanak_flutter/data_types/currency_value.dart';
import 'package:uuid/uuid.dart';

enum AssetType {
  stocks,
  physical,
  crypot,
  realEstate,
  virtual,
  cash,
  bonds,
  etf,
  mutualFund,
  annuity,
  other,
  undefined,
}

class Asset {
  Uuid? assetId;
  String assetName = "UNDEFINED ASSET";
  String? assetSymbol;
  AssetType assetType = AssetType.undefined;
  String currency = "USD";
  CurrencyValue unitValue = CurrencyValue(0);
  String? assetDescription;
}