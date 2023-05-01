import 'package:deedee/generated/deedee/api/model/account.pb.dart';

import 'package:injectable/injectable.dart';
import 'package:fixnum/fixnum.dart';
import 'package:dartx/dartx.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class AccountServiceApi {
  late List<Account> _accounts;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _accounts = [];
  }

  List<Account> getAccounts(Account account) {
    return _accounts
        .filter((element) =>
            element.accountId == account.accountId &&
            account.status != Account_Status.DELETED)
        .toList();
  }

  Account createAccount(Account account) {
    Account accountNew = Account(
        accountId: account.accountId,
        value: account.value,
        userId: account.userId,
        status: account.status,
        type: account.type,
        balance: account.balance);
    _accounts.add(accountNew);
    return accountNew;
  }

  Account deleteAccount(Account account) {
    return _accounts
        .firstWhere((element) => element.accountId == account.accountId);
  }

  Account modifyAccount(Account account) {
    Account accountModify = _accounts.firstWhere(
        (element) =>
            element.accountId == account.accountId &&
            account.status != Account_Status.DELETED,
        orElse: () => Account(
            accountId: account.accountId,
            value: account.value,
            userId: account.userId,
            status: account.status,
            balance: account.balance));
    accountModify.status = account.status;
    accountModify.value = account.value;
    accountModify.type = account.type;
    return accountModify;
  }
}
