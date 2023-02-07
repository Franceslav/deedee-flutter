part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class InitialState extends AccountState {}

class TogglePremiumState extends AccountBloc {}
