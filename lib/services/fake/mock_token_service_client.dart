import 'package:deedee/generated/deedee/api/service/token_service.pbgrpc.dart';
import 'package:deedee/services/fake/api/token_service_api.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

import '../../injection.dart';
import 'fake_client.dart';

@LazySingleton(as: TokenServiceClient, env: [Environment.dev])
class MockTokenServiceClient implements TokenServiceClient {
  TokenServiceApi api = locator.get<TokenServiceApi>();

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
  ResponseFuture<TokenResponse> getToken(TokenRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TokenResponse>(_getToken(request)));
  }

  Future<TokenResponse> _getToken(TokenRequest request) async {
    return TokenResponse()..token = (await api.getToken(request.userId));
  }
}
