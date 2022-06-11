import 'package:kanak_flutter/data_types/currency_value.dart';
import 'package:uuid/uuid.dart';

class TemporaryAsset {
  final String temporaryAssetId = Uuid().v4();
  final String assetName;
  String? assetDescription;
  final CurrencyValue units;
  final CurrencyValue currentUnitValue;
  String baseCurrency = "USD";

  TemporaryAsset({required this.assetName, required this.units, required this.currentUnitValue, this.assetDescription});
}