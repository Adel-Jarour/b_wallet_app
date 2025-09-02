class CardModel {
  final String image;
  final String cardType;
  final String cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final String cvc;

  CardModel({
    required this.image,
    required this.cardType,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvc,
  });
}
