///
//  Generated code. Do not modify.
//  source: deedee/api/service/token_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'token_service.pb.dart' as $0;
export 'token_service.pb.dart';

class TokenServiceClient extends $grpc.Client {
  static final _$getToken =
      $grpc.ClientMethod<$0.TokenRequest, $0.TokenResponse>(
          '/deedee.api.token.service.TokenService/getToken',
          ($0.TokenRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TokenResponse.fromBuffer(value));

  TokenServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TokenResponse> getToken($0.TokenRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getToken, request, options: options);
  }
}

abstract class TokenServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.token.service.TokenService';

  TokenServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TokenRequest, $0.TokenResponse>(
        'getToken',
        getToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TokenRequest.fromBuffer(value),
        ($0.TokenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TokenResponse> getToken_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TokenRequest> request) async {
    return getToken(call, await request);
  }

  $async.Future<$0.TokenResponse> getToken(
      $grpc.ServiceCall call, $0.TokenRequest request);
}
