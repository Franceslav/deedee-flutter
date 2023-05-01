import 'package:deedee/services/fake/api/verification_service_api.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';
import '../../generated/deedee/api/model/verification.pb.dart';
import '../../generated/deedee/api/service/verification_service.pbgrpc.dart';
import '../../injection.dart';
import 'fake_client.dart';

@LazySingleton(as: VerificationServiceClient, env: [Environment.dev])
class MockVerificationServiceClient implements VerificationServiceClient {
 VerificationServiceApi api = locator.get<VerificationServiceApi>();

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
  ResponseFuture<VerificationResponse> cancelVerification(
      VerificationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, VerificationResponse>(
        _cancelVerification(request)));
  }

  Future<VerificationResponse> _cancelVerification(
      VerificationRequest request) async {
    return VerificationResponse(
      verifications: [
        api.cancelVerification(request.verification),
      ],
    );
  }

  @override
  ResponseFuture<VerificationResponse> createVerification(
      VerificationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, VerificationResponse>(
        _createVerification(request)));
  }

  Future<VerificationResponse> _createVerification(
      VerificationRequest request) async {
    return VerificationResponse(
      verifications: [
        api.createVerification(request.verification),
      ],
    );
  }

  @override
  ResponseFuture<VerificationResponse> getVerifications(
      VerificationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, VerificationResponse>(
        _getVerifications(request)));
  }

  Future<VerificationResponse> _getVerifications(
    VerificationRequest request,
  ) async {
    return VerificationResponse(
      verifications:
        api.getVerifications(request.verification),
    );
  }

  @override
  ResponseFuture<VerificationResponse> modifyVerification(
      VerificationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, VerificationResponse>(
        _modifyVerification(request)));
  }

  Future<VerificationResponse> _modifyVerification(
    VerificationRequest request,
  ) async {
    return VerificationResponse(
      verifications: [
        api.modifyVerification(request.verification),
      ],
    );
  }
}
