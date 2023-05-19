import 'package:deedee/generated/deedee/api/model/account.pb.dart';
import 'package:deedee/generated/deedee/api/service/account_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class AccountRepository {
  final AccountServiceClient _accountServiceClient =
      locator.get<AccountServiceClient>();

  Future<List<Account>> getAll(String userId) async {
    final response = await _accountServiceClient.getAccounts(
      AccountRequest(
        account: Account(
          userId: userId,
        ),
      ),
    );
    return response.accounts;
  }

  Future<Account> create(Account account) async {
    final response = await _accountServiceClient.createAccount(
      AccountRequest(
        account: Account(
          accountId: account.accountId,
          value: account.value,
          userId: account.userId,
          status: account.status,
          type: account.type,
          balance: account.balance,
        ),
      ),
    );
    return response.accounts.first;
  }

  Future<Account> modify(Account currentRequest) async {
    final response = await _accountServiceClient.modifyAccount(
      AccountRequest(
          account: Account(
              accountId: currentRequest.accountId,
              userId: currentRequest.userId,
              value: currentRequest.value,
              status: currentRequest.status,
              type: currentRequest.type,
              balance: currentRequest.balance)),
    );
    return response.accounts
        .firstWhere((element) => element.accountId == currentRequest.accountId);
  }

  Future<Account> delete(Account accountId) async {
    final response = await _accountServiceClient.deleteAccount(
      AccountRequest(
        account: Account(
          accountId: accountId.accountId,
          status: Account_Status.DELETED,
        ),
      ),
    );
    return response.accounts
        .firstWhere((element) => element.accountId == accountId.accountId);
  }
}
