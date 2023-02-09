///
import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;

import 'ReferralService.pb.dart' as $0;

export 'ReferralService.pb.dart';

class ReferralServiceClient extends $grpc.Client {
  static final _$getUserReferrals = $grpc.ClientMethod<
          $0.GetUserReferralsRequest, $0.GetUserReferralsResponse>(
      '/bucket.ReferralService/GetUserReferrals',
      ($0.GetUserReferralsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetUserReferralsResponse.fromBuffer(value));

  ReferralServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetUserReferralsResponse> getUserReferrals(
      $0.GetUserReferralsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserReferrals, request, options: options);
  }
}

abstract class ReferralServiceBase extends $grpc.Service {
  $core.String get $name => 'bucket.ReferralService';

  ReferralServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserReferralsRequest,
            $0.GetUserReferralsResponse>(
        'GetUserReferrals',
        getUserReferrals_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetUserReferralsRequest.fromBuffer(value),
        ($0.GetUserReferralsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUserReferralsResponse> getUserReferrals_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetUserReferralsRequest> request) async {
    return getUserReferrals(call, await request);
  }

  $async.Future<$0.GetUserReferralsResponse> getUserReferrals(
      $grpc.ServiceCall call, $0.GetUserReferralsRequest request);
}
