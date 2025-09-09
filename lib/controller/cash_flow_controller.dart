import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/chart_data_model.dart';
import 'package:b_wallet/models/transaction_model.dart';
import 'package:get/get.dart';

class CashFlowController extends GetxController {
  final List<ChartDataModel> chartData = [
    ChartDataModel("Mon", 70, 60),
    ChartDataModel("Tue", 80, 65),
    ChartDataModel("Wed", 75, 55),
    ChartDataModel("Thu", 85, 70),
    ChartDataModel("Fri", 50, 45),
    ChartDataModel("Sat", 30, 40),
    ChartDataModel("Sun", 40, 50),
  ];

  List<TransactionModel> transactions = [
    TransactionModel(
      icon: ImageConst.percentIcon,
      title: 'Cashback Promo',
      date: '1 Jan 2020',
      price: 16000,
      transactionType: TransactionType.income,
    ),
    TransactionModel(
      icon: ImageConst.foodIcon,
      title: 'Food Delivery',
      date: '1 Jan 2020',
      price: 56000,
      transactionType: TransactionType.expense,
    ),
    TransactionModel(
      icon: ImageConst.requestIcon,
      title: 'Money Received',
      date: '1 Jan 2020',
      price: 16000,
      transactionType: TransactionType.income,
    ),
    TransactionModel(
      icon: ImageConst.percentIcon,
      title: 'Cashback Promo',
      date: '1 Jan 2020',
      price: 16000,
      transactionType: TransactionType.income,
    ),
    TransactionModel(
      icon: ImageConst.foodIcon,
      title: 'Food Delivery',
      date: '1 Jan 2020',
      price: 56000,
      transactionType: TransactionType.expense,
    ),
    TransactionModel(
      icon: ImageConst.requestIcon,
      title: 'Money Received',
      date: '1 Jan 2020',
      price: 16000,
      transactionType: TransactionType.income,
    ),
  ];

  int transactionFilterTypeIndex = 0;

  void updateTransactionFilterTypeIndex(int index) {
    transactionFilterTypeIndex = index;
    update(['transactionFilterTypeIndex']);
  }

  List transactionFilterType = [
    (0, 'All Transaction', TransactionType.all),
    (1, 'Income', TransactionType.income),
    (2, 'Expense', TransactionType.expense),
  ];
}
