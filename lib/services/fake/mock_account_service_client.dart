import 'package:deedee/generated/deedee/api/service/account_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/account_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AccountServiceClient, env: [Environment.dev])
class MockAccountServiceClient implements AccountServiceClient {
  AccountServiceApi api = locator.get<AccountServiceApi>();

  @override
  ClientCall<Q, R> $createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request,
      {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<AccountResponse> createAccount(AccountRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, AccountResponse>(_createAccount(request)));
  }

  Future<AccountResponse> _createAccount(
    AccountRequest request,
  ) async {
    return AccountResponse(
      accounts: [
        api.createAccount(request.account),
      ],
    );
  }

  @override
  ResponseFuture<AccountResponse> deleteAccount(AccountRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, AccountResponse>(_deleteAccount(request)));
  }

  Future<AccountResponse> _deleteAccount(
    AccountRequest request,
  ) async {
    return AccountResponse(
      accounts: [
        api.deleteAccount(
          request.account,
        )
      ],
    );
  }

  @override
  ResponseFuture<AccountResponse> getAccounts(AccountRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, AccountResponse>(_getAccounts(request)));
  }

  Future<AccountResponse> _getAccounts(
    AccountRequest request,
  ) async {
    return AccountResponse()
      ..accounts.addAll(
        api.getAccounts(request.account),
      );
  }

  @override
  ResponseFuture<AccountResponse> modifyAccount(AccountRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, AccountResponse>(_modifyAccount(request)));
  }

  Future<AccountResponse> _modifyAccount(
    AccountRequest request,
  ) async {
    return AccountResponse(
      accounts: [
        api.modifyAccount(request.account),
      ],
    );
  }
}
