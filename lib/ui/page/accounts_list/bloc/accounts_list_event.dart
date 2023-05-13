part of 'accounts_list_bloc.dart';

@immutable
abstract class AccountsListEvent {}

class AccountBlockedEvent extends AccountsListEvent {
  final List<Account> blockedAccounts;

  AccountBlockedEvent({required this.blockedAccounts});
}

class AccountsActiveEvent extends AccountsListEvent {
  final List<Account> activeAccounts;

  AccountsActiveEvent({required this.activeAccounts});
}
