part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountPlacesLoadState extends AccountState {
  final List<Location> places;

  AccountPlacesLoadState(this.places);
}
