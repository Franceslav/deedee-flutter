///
//  Generated code. Do not modify.
//  source: deedee/api/service/referral_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'referral_service.pb.dart' as $0;
export 'referral_service.pb.dart';

class ReferralServiceClient extends $grpc.Client {
  static final _$addReferral =
      $grpc.ClientMethod<$0.ReferralRequest, $0.ReferralResponse>(
          '/deedee.api.referral.service.ReferralService/addReferral',
          ($0.ReferralRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ReferralResponse.fromBuffer(value));
  static final _$removeReferral =
      $grpc.ClientMethod<$0.ReferralRequest, $0.ReferralResponse>(
          '/deedee.api.referral.service.ReferralService/removeReferral',
          ($0.ReferralRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ReferralResponse.fromBuffer(value));
  static final _$editReferral =
      $grpc.ClientMethod<$0.ReferralRequest, $0.ReferralResponse>(
          '/deedee.api.referral.service.ReferralService/editReferral',
          ($0.ReferralRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ReferralResponse.fromBuffer(value));
  static final _$getReferrals =
      $grpc.ClientMethod<$0.ReferralRequest, $0.ReferralResponse>(
          '/deedee.api.referral.service.ReferralService/getReferrals',
          ($0.ReferralRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ReferralResponse.fromBuffer(value));

  ReferralServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ReferralResponse> addReferral(
      $0.ReferralRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addReferral, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReferralResponse> removeReferral(
      $0.ReferralRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeReferral, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReferralResponse> editReferral(
      $0.ReferralRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editReferral, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReferralResponse> getReferrals(
      $0.ReferralRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getReferrals, request, options: options);
  }
}

abstract class ReferralServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.referral.service.ReferralService';

  ReferralServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ReferralRequest, $0.ReferralResponse>(
        'addReferral',
        addReferral_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReferralRequest.fromBuffer(value),
        ($0.ReferralResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReferralRequest, $0.ReferralResponse>(
        'removeReferral',
        removeReferral_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReferralRequest.fromBuffer(value),
        ($0.ReferralResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReferralRequest, $0.ReferralResponse>(
        'editReferral',
        editReferral_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReferralRequest.fromBuffer(value),
        ($0.ReferralResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReferralRequest, $0.ReferralResponse>(
        'getReferrals',
        getReferrals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReferralRequest.fromBuffer(value),
        ($0.ReferralResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ReferralResponse> addReferral_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ReferralRequest> request) async {
    return addReferral(call, await request);
  }

  $async.Future<$0.ReferralResponse> removeReferral_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ReferralRequest> request) async {
    return removeReferral(call, await request);
  }

  $async.Future<$0.ReferralResponse> editReferral_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ReferralRequest> request) async {
    return editReferral(call, await request);
  }

  $async.Future<$0.ReferralResponse> getReferrals_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ReferralRequest> request) async {
    return getReferrals(call, await request);
  }

  $async.Future<$0.ReferralResponse> addReferral(
      $grpc.ServiceCall call, $0.ReferralRequest request);
  $async.Future<$0.ReferralResponse> removeReferral(
      $grpc.ServiceCall call, $0.ReferralRequest request);
  $async.Future<$0.ReferralResponse> editReferral(
      $grpc.ServiceCall call, $0.ReferralRequest request);
  $async.Future<$0.ReferralResponse> getReferrals(
      $grpc.ServiceCall call, $0.ReferralRequest request);
}
