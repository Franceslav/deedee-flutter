///
//  Generated code. Do not modify.
//  source: AccountService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;

import 'AccountService.pb.dart' as $0;

export 'AccountService.pb.dart';

class AccountServiceClient extends $grpc.Client {
  static final _$topUp = $grpc.ClientMethod<$0.TopUpRequest, $0.TopUpResponse>(
      '/topic.AccountService/TopUp',
      ($0.TopUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TopUpResponse.fromBuffer(value));
  static final _$getBalance =
      $grpc.ClientMethod<$0.GetBalanceRequest, $0.GetBalanceResponse>(
          '/topic.AccountService/GetBalance',
          ($0.GetBalanceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetBalanceResponse.fromBuffer(value));
  static final _$getAccountStatus =
      $grpc.ClientMethod<$0.AccountStatusRequest, $0.AccountStatusResponse>(
          '/topic.AccountService/GetAccountStatus',
          ($0.AccountStatusRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountStatusResponse.fromBuffer(value));
  static final _$toggleAccountStatus =
      $grpc.ClientMethod<$0.AccountStatusRequest, $0.AccountStatusResponse>(
          '/topic.AccountService/ToggleAccountStatus',
          ($0.AccountStatusRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountStatusResponse.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TopUpResponse> topUp($0.TopUpRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$topUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBalanceResponse> getBalance(
      $0.GetBalanceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBalance, request, options: options);
  }

  $grpc.ResponseFuture<$0.AccountStatusResponse> getAccountStatus(
      $0.AccountStatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccountStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.AccountStatusResponse> toggleAccountStatus(
      $0.AccountStatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$toggleAccountStatus, request, options: options);
  }
}

abstract class AccountServiceBase extends $grpc.Service {
  $core.String get $name => 'topic.AccountService';

  AccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TopUpRequest, $0.TopUpResponse>(
        'TopUp',
        topUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TopUpRequest.fromBuffer(value),
        ($0.TopUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBalanceRequest, $0.GetBalanceResponse>(
        'GetBalance',
        getBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBalanceRequest.fromBuffer(value),
        ($0.GetBalanceResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AccountStatusRequest, $0.AccountStatusResponse>(
            'GetAccountStatus',
            getAccountStatus_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AccountStatusRequest.fromBuffer(value),
            ($0.AccountStatusResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AccountStatusRequest, $0.AccountStatusResponse>(
            'ToggleAccountStatus',
            toggleAccountStatus_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AccountStatusRequest.fromBuffer(value),
            ($0.AccountStatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TopUpResponse> topUp_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TopUpRequest> request) async {
    return topUp(call, await request);
  }

  $async.Future<$0.GetBalanceResponse> getBalance_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBalanceRequest> request) async {
    return getBalance(call, await request);
  }

  $async.Future<$0.AccountStatusResponse> getAccountStatus_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AccountStatusRequest> request) async {
    return getAccountStatus(call, await request);
  }

  $async.Future<$0.AccountStatusResponse> toggleAccountStatus_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AccountStatusRequest> request) async {
    return toggleAccountStatus(call, await request);
  }

  $async.Future<$0.TopUpResponse> topUp(
      $grpc.ServiceCall call, $0.TopUpRequest request);
  $async.Future<$0.GetBalanceResponse> getBalance(
      $grpc.ServiceCall call, $0.GetBalanceRequest request);
  $async.Future<$0.AccountStatusResponse> getAccountStatus(
      $grpc.ServiceCall call, $0.AccountStatusRequest request);
  $async.Future<$0.AccountStatusResponse> toggleAccountStatus(
      $grpc.ServiceCall call, $0.AccountStatusRequest request);
}
