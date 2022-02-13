import 'package:uuid/uuid.dart';

enum AccountType {
  cash,
  stock,
}


class Account{
  Uuid? accountId;
  String? accountName;
  String? accountDescription;
  String baseCurrency = "USD";
  Account? parentAccount;
}