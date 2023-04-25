import 'package:deedee/generated/deedee/api/service/topic_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/topic_repository.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TopicServiceClient, env: [Environment.dev])
class MockTopicServiceClient implements TopicServiceClient {
  TopicServiceApi api = locator.get<TopicServiceApi>();

  @override
  ClientCall<Q, R> $createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request,
      {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<SubtopicResponse> getSubtopics(SubtopicRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, SubtopicResponse>(_getSubtopics(request)));
  }

  Future<SubtopicResponse> _getSubtopics(SubtopicRequest request) async {
    return SubtopicResponse()
      ..subtopics.addAll(await api.getSubTopics(
          request.subtopic.userId, request.subtopic.topicId, 0, 0));
  }

  @override
  ResponseFuture<TopicResponse> getTopics(TopicRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, TopicResponse>(_getTopics(request)));
  }

  Future<TopicResponse> _getTopics(TopicRequest request) async {
    return TopicResponse()
      ..topics.addAll(await api.getTopics(request.topic.userId, 0, 0));
  }
}
