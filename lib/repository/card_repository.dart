import 'package:deedee/ui/page/add_card/card.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class CardRepository {

  final List<CardWidget> _list = [
    CardWidget(isCvvFocused: false, cardNumber: '111', expiryDate: '111', cardHolderName: '111', cvvCode: '111', color: Colors.black),
  ];

  List<CardWidget> get getCards => _list;

  void addNewCard(CardWidget card) => _list.add(card);

  void deleteCard(int index) => _list.removeAt(index);

}
