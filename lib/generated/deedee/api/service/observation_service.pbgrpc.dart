///
//  Generated code. Do not modify.
//  source: deedee/api/service/observation_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'observation_service.pb.dart' as $0;
export 'observation_service.pb.dart';

class ObservationServiceClient extends $grpc.Client {
  static final _$addObservation =
      $grpc.ClientMethod<$0.ObservationRequest, $0.ObservationResponse>(
          '/deedee.api.statistic.service.ObservationService/addObservation',
          ($0.ObservationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ObservationResponse.fromBuffer(value));

  ObservationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ObservationResponse> addObservation(
      $0.ObservationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addObservation, request, options: options);
  }
}

abstract class ObservationServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.statistic.service.ObservationService';

  ObservationServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.ObservationRequest, $0.ObservationResponse>(
            'addObservation',
            addObservation_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ObservationRequest.fromBuffer(value),
            ($0.ObservationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ObservationResponse> addObservation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ObservationRequest> request) async {
    return addObservation(call, await request);
  }

  $async.Future<$0.ObservationResponse> addObservation(
      $grpc.ServiceCall call, $0.ObservationRequest request);
}
