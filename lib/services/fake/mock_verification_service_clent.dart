import '../../generated/VerificationService.pbgrpc.dart';
import 'package:grpc/src/client/method.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/call.dart';
import 'package:injectable/injectable.dart';

import 'fake_client.dart';

@LazySingleton(as: VerificationServiceClient, env: [Environment.dev])
class MockVerificationServiceClient implements VerificationServiceClient {
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
  ResponseFuture<VerifyDocumentsResponse> verifyDocuments(
      VerifyDocumentsRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, VerifyDocumentsResponse>(
        _verifyDocuments(request)));
  }

  Future<VerifyDocumentsResponse> _verifyDocuments(
      VerifyDocumentsRequest request) async {
    return VerifyDocumentsResponse()..processed = true;
  }

  @override
  ResponseFuture<VerifyEmailResponse> verifyEmail(VerifyEmailRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, VerifyEmailResponse>(_verifyEmail(request)));
  }

  Future<VerifyEmailResponse> _verifyEmail(VerifyEmailRequest request) async {
    return VerifyEmailResponse()..processed = true;
  }
}
