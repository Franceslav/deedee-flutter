import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/account.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/account_repository.dart';
import 'package:meta/meta.dart';

part 'accounts_list_event.dart';
part 'accounts_list_state.dart';

class AccountsListBloc extends Bloc<AccountsListEvent, AccountsListState> {
  final AccountRepository _accountRepository;
  final User _user;

  AccountsListBloc(
    this._accountRepository,
    this._user,
  ) : super(AccountsListInitial()) {
    on<AccountsActiveEvent>(_onActiveAccounts);
    on<AccountBlockedEvent>(_onBlockedAccounts);
    initialize();
  }

  Future<void> initialize() async {
    try {
      final accounts = await _accountRepository.getAll(_user.userId);
      final firstSort = activeFilter(accounts);
      updateScreen(firstSort);
    } catch (error) {
      stderr.writeln(error.toString());
    }
  }

  void updateScreen(List<Account> accounts) {
    emit(AccountsLoadState(accounts));
  }

  List<Account> activeFilter(List<Account> accounts) {
    return accounts
        .where((element) =>
            element.status == Account_Status.ACTIVE ||
            element.status == Account_Status.SUSPENDED)
        .toList();
  }

  List<Account> blockFilter(List<Account> accounts) {
    return accounts
        .where((element) =>
            element.status == Account_Status.DELETED ||
            element.status == Account_Status.BLOCKED)
        .toList();
  }

  void _onActiveAccounts(
      AccountsActiveEvent event, Emitter<AccountsListState> emit) async {
    try {
      final response = await _accountRepository.getAll(_user.userId);
      final activeAccounts = activeFilter(response);
      updateScreen(activeAccounts);
    } catch (error) {
      stderr.writeln(error.toString());
    }
  }

  void _onBlockedAccounts(
      AccountBlockedEvent event, Emitter<AccountsListState> emit) async {
    try {
      final response = await _accountRepository.getAll(_user.userId);
      final blockedAccounts = blockFilter(response);
      updateScreen(blockedAccounts);
    } catch (error) {
      stderr.writeln(error.toString());
    }
  }
}
