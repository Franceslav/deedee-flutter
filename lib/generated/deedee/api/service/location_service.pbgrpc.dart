///
//  Generated code. Do not modify.
//  source: deedee/api/service/location_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;

import 'location_service.pb.dart' as $0;

export 'location_service.pb.dart';

class LocationServiceClient extends $grpc.Client {
  static final _$addLocation =
      $grpc.ClientMethod<$0.LocationRequest, $0.LocationResponse>(
          '/deedee.api.location.service.LocationService/addLocation',
          ($0.LocationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LocationResponse.fromBuffer(value));
  static final _$getAllLocations =
      $grpc.ClientMethod<$0.LocationRequest, $0.LocationResponse>(
          '/deedee.api.location.service.LocationService/getAllLocations',
          ($0.LocationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LocationResponse.fromBuffer(value));

  LocationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LocationResponse> addLocation(
      $0.LocationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addLocation, request, options: options);
  }

  $grpc.ResponseFuture<$0.LocationResponse> getAllLocations(
      $0.LocationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllLocations, request, options: options);
  }
}

abstract class LocationServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.location.service.LocationService';

  LocationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LocationRequest, $0.LocationResponse>(
        'addLocation',
        addLocation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LocationRequest.fromBuffer(value),
        ($0.LocationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LocationRequest, $0.LocationResponse>(
        'getAllLocations',
        getAllLocations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LocationRequest.fromBuffer(value),
        ($0.LocationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LocationResponse> addLocation_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LocationRequest> request) async {
    return addLocation(call, await request);
  }

  $async.Future<$0.LocationResponse> getAllLocations_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LocationRequest> request) async {
    return getAllLocations(call, await request);
  }

  $async.Future<$0.LocationResponse> addLocation(
      $grpc.ServiceCall call, $0.LocationRequest request);
  $async.Future<$0.LocationResponse> getAllLocations(
      $grpc.ServiceCall call, $0.LocationRequest request);
}
