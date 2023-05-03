///
//  Generated code. Do not modify.
//  source: deedee/api/service/verification_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'verification_service.pb.dart' as $0;
export 'verification_service.pb.dart';

class VerificationServiceClient extends $grpc.Client {
  static final _$createVerification = $grpc.ClientMethod<$0.VerificationRequest,
          $0.VerificationResponse>(
      '/deedee.api.verification.service.VerificationService/createVerification',
      ($0.VerificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.VerificationResponse.fromBuffer(value));
  static final _$modifyVerification = $grpc.ClientMethod<$0.VerificationRequest,
          $0.VerificationResponse>(
      '/deedee.api.verification.service.VerificationService/modifyVerification',
      ($0.VerificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.VerificationResponse.fromBuffer(value));
  static final _$cancelVerification = $grpc.ClientMethod<$0.VerificationRequest,
          $0.VerificationResponse>(
      '/deedee.api.verification.service.VerificationService/cancelVerification',
      ($0.VerificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.VerificationResponse.fromBuffer(value));
  static final _$getVerifications = $grpc.ClientMethod<$0.VerificationRequest,
          $0.VerificationResponse>(
      '/deedee.api.verification.service.VerificationService/getVerifications',
      ($0.VerificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.VerificationResponse.fromBuffer(value));

  VerificationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.VerificationResponse> createVerification(
      $0.VerificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createVerification, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerificationResponse> modifyVerification(
      $0.VerificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$modifyVerification, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerificationResponse> cancelVerification(
      $0.VerificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelVerification, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerificationResponse> getVerifications(
      $0.VerificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getVerifications, request, options: options);
  }
}

abstract class VerificationServiceBase extends $grpc.Service {
  $core.String get $name =>
      'deedee.api.verification.service.VerificationService';

  VerificationServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.VerificationRequest, $0.VerificationResponse>(
            'createVerification',
            createVerification_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.VerificationRequest.fromBuffer(value),
            ($0.VerificationResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.VerificationRequest, $0.VerificationResponse>(
            'modifyVerification',
            modifyVerification_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.VerificationRequest.fromBuffer(value),
            ($0.VerificationResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.VerificationRequest, $0.VerificationResponse>(
            'cancelVerification',
            cancelVerification_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.VerificationRequest.fromBuffer(value),
            ($0.VerificationResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.VerificationRequest, $0.VerificationResponse>(
            'getVerifications',
            getVerifications_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.VerificationRequest.fromBuffer(value),
            ($0.VerificationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.VerificationResponse> createVerification_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerificationRequest> request) async {
    return createVerification(call, await request);
  }

  $async.Future<$0.VerificationResponse> modifyVerification_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerificationRequest> request) async {
    return modifyVerification(call, await request);
  }

  $async.Future<$0.VerificationResponse> cancelVerification_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerificationRequest> request) async {
    return cancelVerification(call, await request);
  }

  $async.Future<$0.VerificationResponse> getVerifications_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerificationRequest> request) async {
    return getVerifications(call, await request);
  }

  $async.Future<$0.VerificationResponse> createVerification(
      $grpc.ServiceCall call, $0.VerificationRequest request);
  $async.Future<$0.VerificationResponse> modifyVerification(
      $grpc.ServiceCall call, $0.VerificationRequest request);
  $async.Future<$0.VerificationResponse> cancelVerification(
      $grpc.ServiceCall call, $0.VerificationRequest request);
  $async.Future<$0.VerificationResponse> getVerifications(
      $grpc.ServiceCall call, $0.VerificationRequest request);
}
