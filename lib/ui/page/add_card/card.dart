import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class CardWidget extends StatefulWidget {
  final bool isCvvFocused;
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final Color color;

  const CardWidget(
      {Key? key,
      required this.isCvvFocused,
      required this.cardNumber,
      required this.expiryDate,
      required this.cardHolderName,
      required this.cvvCode,
      required this.color})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: widget.cardNumber,
      expiryDate: widget.expiryDate,
      cardHolderName: widget.cardHolderName,
      cvvCode: widget.cvvCode,
      frontCardBorder: Border.all(color: Colors.grey),
      backCardBorder: Border.all(color: Colors.grey),
      showBackView: widget.isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
      isHolderNameVisible: true,
      cardBgColor: widget.color,
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    );
  }
}
