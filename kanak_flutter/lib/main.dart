import 'package:flutter/material.dart';
import 'package:kanak_flutter/data_types/currency_value.dart';
import 'package:kanak_flutter/models/temporary_asset.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<TemporaryAsset> assets = [
      TemporaryAsset(
        assetName: "FB Stock",
        units: CurrencyValue.fromDouble(123.00),
        currentUnitValue: CurrencyValue.fromDouble(219.55),
        assetDescription: "Meta Platforms Inc Class A Stocks",
      ),
      TemporaryAsset(
          assetName: "AMD Stock",
          units: CurrencyValue.fromDouble(30.63965788),
          currentUnitValue: CurrencyValue.fromDouble(64.8898),
          assetDescription: "Advanced Micro Devices"),
      TemporaryAsset(
        assetName: "Berkishire Hathaway Stock",
        units: CurrencyValue.fromDouble(6.26847826),
        currentUnitValue: CurrencyValue.fromDouble(158.6940),
        assetDescription: "Berkshire Hathaway",
      ),
    ];

    return MaterialApp(
      title: 'Kanak',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kanak'),
        ),
        body: Container(
          child: Column(
            children: assets.map((asset) {
              return Card(child: Text(asset.currentUnitValue.toString()));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
