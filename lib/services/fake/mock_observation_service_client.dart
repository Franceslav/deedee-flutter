import 'package:deedee/generated/deedee/api/service/observation_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/tag_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ObservationServiceClient, env: [Environment.dev])
class MockObservationServiceClient implements ObservationServiceClient {
  TagServiceApi api = locator.get<TagServiceApi>();

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
  ResponseFuture<ObservationResponse> addObservation(
      ObservationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ObservationResponse>(
        _addObservation(request),
      ),
    );
  }

  Future<ObservationResponse> _addObservation (ObservationRequest request) async {
    return ObservationResponse(
      observations: [
        api.addObservation(request.observation),
      ]
    );
  }
}
