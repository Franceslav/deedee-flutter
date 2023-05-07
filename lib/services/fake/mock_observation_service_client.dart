import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/observation.pb.dart';
import 'package:deedee/generated/deedee/api/service/observation_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/observation_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ObservationServiceClient, env: [Environment.dev])
class MockObservationServiceClient implements ObservationServiceClient {
  ObservationServiceApi api = locator.get<ObservationServiceApi>();

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
        api.create(
          Observation(
            observationId: request.observation.observationId,
            userId: request.observation.userId,
            geolocation: request.observation.geolocation,
          )
        ),
      ]
    );
  }

  @override
  ResponseFuture<ObservationResponse> getObservations(
      ObservationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ObservationResponse>(
        _getObservations(request),
      ),
    );
  }

  Future<ObservationResponse> _getObservations(
      ObservationRequest request) async {
    var observations = api.read();
    return ObservationResponse()..observations.addAll(observations);
  }

  @override
  ResponseFuture<ObservationResponse> updateObservation(
      ObservationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ObservationResponse>(
        _updateObservation(request),
      ),
    );
  }

  Future<ObservationResponse> _updateObservation(
      ObservationRequest request) async {

    return ObservationResponse(
      observations: [
        api.update(
         Observation(
            observationId: request.observation.observationId,
            userId: request.observation.userId,
            geolocation: request.observation.geolocation,
          )
        ),
      ]
    );
  }
}
