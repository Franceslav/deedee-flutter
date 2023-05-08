import 'package:bloc/bloc.dart';
import 'package:deedee/repository/card_repository.dart';
import 'package:deedee/ui/page/add_card/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';

part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final _repository = CardRepository();

  CardBloc() : super(CardInitial()) {
    on<CardModelChangedEvent>(_onCardModelChanged);
    on<SaveCardDataEvent>(_onSaveCardData);
    initState();
  }

  initState() {
    _updateScreen(CreditCardModel('', '', '', '', false));
  }

  void _onCardModelChanged(
      CardModelChangedEvent event, Emitter<CardState> emit) {
    _updateScreen(event.cardModel);
  }

  void _updateScreen(cardModel) {
    emit(UpdateCardState(cardModel: cardModel, cards: _repository.getCards));
  }

  void _onSaveCardData(SaveCardDataEvent event, Emitter<CardState> emit) {
    final cardModel = event.cardModel;
    _repository.addNewCard(CardWidget(
        isCvvFocused: cardModel.isCvvFocused,
        cardNumber: cardModel.cardNumber,
        expiryDate: cardModel.expiryDate,
        cardHolderName: cardModel.cardHolderName,
        cvvCode: cardModel.cvvCode,
        color: Colors.deepPurple));
    print(_repository.getCards); // dev
    _updateScreen(cardModel);
  }
}
