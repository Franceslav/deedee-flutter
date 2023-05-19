import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/account.pb.dart';
import 'package:deedee/generated/deedee/api/model/balance.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class AccountServiceApi {
  late List<Account> _accounts;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _accounts = [
      Account(
        accountId: Int64(255486124223129307),
        value: "Something",
        userId: "cYvGL2800dhwhcWQkFGRNwGnOVZ2",
        status: Account_Status.ACTIVE,
        type: Account_Type.REGISTERED,
        balance: [Balance()..value = 3112.43],
      ),
      Account(
        accountId: Int64(255486124223129307),
        value: "Something",
        userId: "cYvGL2800dhwhcWQkFGRNwGnOVZ2",
        status: Account_Status.DELETED,
        type: Account_Type.REGISTERED,
        balance: [Balance()..value = 3002.43],
      ),
      Account(
        accountId: Int64(25541238612239307),
        value: "Something",
        userId: "cYvGL2800dhwhcWQkFGRNwGnOVZ2",
        status: Account_Status.SUSPENDED,
        type: Account_Type.REGISTERED,
        balance: [Balance()..value = 3992.43],
      ),
      Account(
        accountId: Int64(255481236129307),
        value: "Something",
        userId: "cYvGL2800dhwhcWQkFGRNwGnOVZ2",
        status: Account_Status.BLOCKED,
        type: Account_Type.REGISTERED,
        balance: [Balance()..value = 3232232.43],
      ),
      Account(
        accountId: Int64(2554842426129307),
        value: "Something",
        userId: "cYvGL2800dhwhcWQkFGRNwGnOVZ2",
        status: Account_Status.ACTIVE,
        type: Account_Type.REGISTERED,
        balance: [Balance()..value = 3232.43],
      ),
      Account(
        accountId: Int64(2554861294444307),
        value: "Something",
        userId: "cYvGL2800dhwhcWQkFGRNwGnOVZ2",
        status: Account_Status.SUSPENDED,
        type: Account_Type.REGISTERED,
        balance: [Balance()..value = 323.43],
      ),
    ];
  }

  List<Account> getAccounts(Account account) {
    return _accounts
        .filter((element) =>
            element.userId == account.userId &&
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
