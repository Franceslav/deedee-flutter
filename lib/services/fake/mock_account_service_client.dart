import 'package:deedee/generated/AccountService.pbgrpc.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AccountServiceClient, env: [Environment.dev])
class MockAccountServiceClient implements AccountServiceClient {
  @override
  ClientCall<Q, R> $createCall<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request, {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<GetBalanceResponse> getBalance(GetBalanceRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, GetBalanceResponse>(_getBalance(request)));
  }

  Future<GetBalanceResponse> _getBalance(GetBalanceRequest request) async {
    return GetBalanceResponse()..balance = 268.56;
  }

  @override
  ResponseFuture<TopUpResponse> topUp(TopUpRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, TopUpResponse>(_topUp(request)));

  }

  Future<TopUpResponse> _topUp(TopUpRequest request) async {
    return TopUpResponse()..succeed = true;
  }

  @override
  ResponseFuture<AccountStatusResponse> getAccountStatus(AccountStatusRequest request, {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, AccountStatusResponse>(_getAccountStatus(request)));
  }

  Future<AccountStatusResponse> _getAccountStatus(AccountStatusRequest request) async {
    return AccountStatusResponse()..isPremium = true;
  }

  @override
  ResponseFuture<AccountStatusResponse> toggleAccountStatus(AccountStatusRequest request, {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, AccountStatusResponse>(_toggleAccountStatus(request)));
  }

  Future<AccountStatusResponse> _toggleAccountStatus(AccountStatusRequest request) async {
    return AccountStatusResponse()..isPremium = true;
  }

}
