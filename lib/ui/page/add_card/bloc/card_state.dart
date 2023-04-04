part of 'card_bloc.dart';

@immutable
abstract class CardState {}

class CardInitial extends CardState {}

class UpdateCardState extends CardState {
  final CreditCardModel cardModel;
  final List<CardWidget> cards;

  UpdateCardState({required this.cardModel, required this.cards});
}
