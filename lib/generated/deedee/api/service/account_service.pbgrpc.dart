///
//  Generated code. Do not modify.
//  source: deedee/api/service/account_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'account_service.pb.dart' as $0;
export 'account_service.pb.dart';

class AccountServiceClient extends $grpc.Client {
  static final _$createAccount =
      $grpc.ClientMethod<$0.AccountRequest, $0.AccountResponse>(
          '/deedee.api.account.service.AccountService/createAccount',
          ($0.AccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountResponse.fromBuffer(value));
  static final _$modifyAccount =
      $grpc.ClientMethod<$0.AccountRequest, $0.AccountResponse>(
          '/deedee.api.account.service.AccountService/modifyAccount',
          ($0.AccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountResponse.fromBuffer(value));
  static final _$deleteAccount =
      $grpc.ClientMethod<$0.AccountRequest, $0.AccountResponse>(
          '/deedee.api.account.service.AccountService/deleteAccount',
          ($0.AccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountResponse.fromBuffer(value));
  static final _$getAccounts =
      $grpc.ClientMethod<$0.AccountRequest, $0.AccountResponse>(
          '/deedee.api.account.service.AccountService/getAccounts',
          ($0.AccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountResponse.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AccountResponse> createAccount(
      $0.AccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.AccountResponse> modifyAccount(
      $0.AccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$modifyAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.AccountResponse> deleteAccount(
      $0.AccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.AccountResponse> getAccounts(
      $0.AccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccounts, request, options: options);
  }
}

abstract class AccountServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.account.service.AccountService';

  AccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AccountRequest, $0.AccountResponse>(
        'createAccount',
        createAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AccountRequest.fromBuffer(value),
        ($0.AccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AccountRequest, $0.AccountResponse>(
        'modifyAccount',
        modifyAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AccountRequest.fromBuffer(value),
        ($0.AccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AccountRequest, $0.AccountResponse>(
        'deleteAccount',
        deleteAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AccountRequest.fromBuffer(value),
        ($0.AccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AccountRequest, $0.AccountResponse>(
        'getAccounts',
        getAccounts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AccountRequest.fromBuffer(value),
        ($0.AccountResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AccountResponse> createAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AccountRequest> request) async {
    return createAccount(call, await request);
  }

  $async.Future<$0.AccountResponse> modifyAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AccountRequest> request) async {
    return modifyAccount(call, await request);
  }

  $async.Future<$0.AccountResponse> deleteAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AccountRequest> request) async {
    return deleteAccount(call, await request);
  }

  $async.Future<$0.AccountResponse> getAccounts_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AccountRequest> request) async {
    return getAccounts(call, await request);
  }

  $async.Future<$0.AccountResponse> createAccount(
      $grpc.ServiceCall call, $0.AccountRequest request);
  $async.Future<$0.AccountResponse> modifyAccount(
      $grpc.ServiceCall call, $0.AccountRequest request);
  $async.Future<$0.AccountResponse> deleteAccount(
      $grpc.ServiceCall call, $0.AccountRequest request);
  $async.Future<$0.AccountResponse> getAccounts(
      $grpc.ServiceCall call, $0.AccountRequest request);
}
