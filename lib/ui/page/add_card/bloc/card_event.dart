part of 'card_bloc.dart';

@immutable
abstract class CardEvent {}

class CardModelChangedEvent extends CardEvent {
  final CreditCardModel? cardModel;

  CardModelChangedEvent({required this.cardModel});
}

class SaveCardDataEvent extends CardEvent {
  final CreditCardModel cardModel;

  SaveCardDataEvent({required this.cardModel});
}
