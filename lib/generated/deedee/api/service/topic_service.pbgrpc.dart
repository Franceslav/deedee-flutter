///
//  Generated code. Do not modify.
//  source: deedee/api/service/topic_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;

import 'topic_service.pb.dart' as $0;

export 'topic_service.pb.dart';

class TopicServiceClient extends $grpc.Client {
  static final _$getTopics =
      $grpc.ClientMethod<$0.TopicRequest, $0.TopicResponse>(
          '/deedee.api.topic.service.TopicService/getTopics',
          ($0.TopicRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TopicResponse.fromBuffer(value));
  static final _$getSubtopics =
      $grpc.ClientMethod<$0.SubtopicRequest, $0.SubtopicResponse>(
          '/deedee.api.topic.service.TopicService/getSubtopics',
          ($0.SubtopicRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SubtopicResponse.fromBuffer(value));

  TopicServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TopicResponse> getTopics($0.TopicRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopics, request, options: options);
  }

  $grpc.ResponseFuture<$0.SubtopicResponse> getSubtopics(
      $0.SubtopicRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSubtopics, request, options: options);
  }
}

abstract class TopicServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.topic.service.TopicService';

  TopicServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TopicRequest, $0.TopicResponse>(
        'getTopics',
        getTopics_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TopicRequest.fromBuffer(value),
        ($0.TopicResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubtopicRequest, $0.SubtopicResponse>(
        'getSubtopics',
        getSubtopics_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SubtopicRequest.fromBuffer(value),
        ($0.SubtopicResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TopicResponse> getTopics_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TopicRequest> request) async {
    return getTopics(call, await request);
  }

  $async.Future<$0.SubtopicResponse> getSubtopics_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SubtopicRequest> request) async {
    return getSubtopics(call, await request);
  }

  $async.Future<$0.TopicResponse> getTopics(
      $grpc.ServiceCall call, $0.TopicRequest request);
  $async.Future<$0.SubtopicResponse> getSubtopics(
      $grpc.ServiceCall call, $0.SubtopicRequest request);
}
