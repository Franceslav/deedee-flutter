part of 'accounts_list_bloc.dart';

@immutable
abstract class AccountsListState {}

class AccountsListInitial extends AccountsListState {}

class AccountsLoadState extends AccountsListState {
  final List<Account> accounts;

  AccountsLoadState(this.accounts);
}

class ErrorState extends AccountsListState {
  final String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}
