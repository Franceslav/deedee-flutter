import 'package:deedee/generated/deedee/api/service/referral_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/referral_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(
    as: ReferralServiceClient, env: [Environment.dev, Environment.test])
class MockReferralServiceClient implements ReferralServiceClient {
  final _api = locator.get<ReferralServiceApi>();

  @override
  ClientCall<Q, R> $createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request,
      {CallOptions? options}) {
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ReferralResponse> addReferral(ReferralRequest request,
      {CallOptions? options}) {
    final resp = ResponseFuture(
        FakeClientCall<dynamic, ReferralResponse>(_addReferral(request)));
    return resp;
  }

  Future<ReferralResponse> _addReferral(ReferralRequest request) async {
    final resp =
        ReferralResponse(referrals: _api.insertReferral(request.referral));
    return resp;
  }

  @override
  ResponseFuture<ReferralResponse> editReferral(ReferralRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ReferralResponse>(_editReferral(request)));
  }

  Future<ReferralResponse> _editReferral(ReferralRequest request) async {
    return ReferralResponse(referrals: _api.updateReferral(request.referral));
  }

  @override
  ResponseFuture<ReferralResponse> getReferrals(ReferralRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ReferralResponse>(_getReferrals(request)));
  }

  Future<ReferralResponse> _getReferrals(ReferralRequest request) async {
    return ReferralResponse(referrals: _api.getReferral(request.referral));
  }

  @override
  ResponseFuture<ReferralResponse> removeReferral(ReferralRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ReferralResponse>(_removeReferral(request)));
  }

  Future<ReferralResponse> _removeReferral(ReferralRequest request) async {
    return ReferralResponse(referrals: _api.deleteReferral(request.referral));
  }
}
