import 'package:b_wallet/models/transaction_model.dart';
import 'package:get/get.dart';

class TransactionDetailController extends GetxController {
  TransactionDetailController(this.transaction);

  final TransactionModel transaction;

  late final String transactionId;

  bool get isIncome => transaction.transactionType == TransactionType.income;

  @override
  void onInit() {
    super.onInit();
    transactionId = _generateTransactionId();
  }

  String _generateTransactionId() {
    // Simple fake transaction ID for demo purposes.
    final now = DateTime.now();
    return '${now.millisecondsSinceEpoch}'.substring(4, 13);
  }
}

