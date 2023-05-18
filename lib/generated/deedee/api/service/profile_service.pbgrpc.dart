///
//  Generated code. Do not modify.
//  source: deedee/api/service/profile_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'profile_service.pb.dart' as $0;
export 'profile_service.pb.dart';

class ProfileServiceClient extends $grpc.Client {
  static final _$createProfile =
      $grpc.ClientMethod<$0.ProfileRequest, $0.ProfileResponse>(
          '/deedee.api.profile.service.ProfileService/createProfile',
          ($0.ProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ProfileResponse.fromBuffer(value));
  static final _$removeProfile =
      $grpc.ClientMethod<$0.ProfileRequest, $0.ProfileResponse>(
          '/deedee.api.profile.service.ProfileService/removeProfile',
          ($0.ProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ProfileResponse.fromBuffer(value));
  static final _$editProfile =
      $grpc.ClientMethod<$0.ProfileRequest, $0.ProfileResponse>(
          '/deedee.api.profile.service.ProfileService/editProfile',
          ($0.ProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ProfileResponse.fromBuffer(value));
  static final _$getProfile =
      $grpc.ClientMethod<$0.ProfileRequest, $0.ProfileResponse>(
          '/deedee.api.profile.service.ProfileService/getProfile',
          ($0.ProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ProfileResponse.fromBuffer(value));

  ProfileServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ProfileResponse> createProfile(
      $0.ProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProfileResponse> removeProfile(
      $0.ProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProfileResponse> editProfile(
      $0.ProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProfileResponse> getProfile($0.ProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }
}

abstract class ProfileServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.profile.service.ProfileService';

  ProfileServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ProfileRequest, $0.ProfileResponse>(
        'createProfile',
        createProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProfileRequest.fromBuffer(value),
        ($0.ProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProfileRequest, $0.ProfileResponse>(
        'removeProfile',
        removeProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProfileRequest.fromBuffer(value),
        ($0.ProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProfileRequest, $0.ProfileResponse>(
        'editProfile',
        editProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProfileRequest.fromBuffer(value),
        ($0.ProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProfileRequest, $0.ProfileResponse>(
        'getProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProfileRequest.fromBuffer(value),
        ($0.ProfileResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ProfileResponse> createProfile_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProfileRequest> request) async {
    return createProfile(call, await request);
  }

  $async.Future<$0.ProfileResponse> removeProfile_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProfileRequest> request) async {
    return removeProfile(call, await request);
  }

  $async.Future<$0.ProfileResponse> editProfile_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProfileRequest> request) async {
    return editProfile(call, await request);
  }

  $async.Future<$0.ProfileResponse> getProfile_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProfileRequest> request) async {
    return getProfile(call, await request);
  }

  $async.Future<$0.ProfileResponse> createProfile(
      $grpc.ServiceCall call, $0.ProfileRequest request);
  $async.Future<$0.ProfileResponse> removeProfile(
      $grpc.ServiceCall call, $0.ProfileRequest request);
  $async.Future<$0.ProfileResponse> editProfile(
      $grpc.ServiceCall call, $0.ProfileRequest request);
  $async.Future<$0.ProfileResponse> getProfile(
      $grpc.ServiceCall call, $0.ProfileRequest request);
}
