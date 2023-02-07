part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class TogglePremiumEvent extends AccountEvent {
  final String userId;

  TogglePremiumEvent(this.userId);
}
