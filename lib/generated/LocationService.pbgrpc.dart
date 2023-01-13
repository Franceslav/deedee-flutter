///
//  Generated code. Do not modify.
//  source: LocationService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'LocationService.pb.dart' as $0;
export 'LocationService.pb.dart';

class LocationServiceClient extends $grpc.Client {
  static final _$getPlaces =
      $grpc.ClientMethod<$0.GetPlacesRequest, $0.GetPlacesResponse>(
          '/bucket.LocationService/GetPlaces',
          ($0.GetPlacesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetPlacesResponse.fromBuffer(value));

  LocationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetPlacesResponse> getPlaces(
      $0.GetPlacesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlaces, request, options: options);
  }
}

abstract class LocationServiceBase extends $grpc.Service {
  $core.String get $name => 'bucket.LocationService';

  LocationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetPlacesRequest, $0.GetPlacesResponse>(
        'GetPlaces',
        getPlaces_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPlacesRequest.fromBuffer(value),
        ($0.GetPlacesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetPlacesResponse> getPlaces_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetPlacesRequest> request) async {
    return getPlaces(call, await request);
  }

  $async.Future<$0.GetPlacesResponse> getPlaces(
      $grpc.ServiceCall call, $0.GetPlacesRequest request);
}
