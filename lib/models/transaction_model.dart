class TransactionModel {
  String icon;
  String title;
  String date;
  double price;
  TransactionType transactionType;

  TransactionModel({
    required this.icon,
    required this.title,
    required this.date,
    required this.price,
    required this.transactionType,
  });
}

enum TransactionType {
  all,
  expense,
  income,
}
