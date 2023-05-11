import 'package:deedee/generated/deedee/api/service/location_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/location_service_api.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

import 'fake_client.dart';

@LazySingleton(as: LocationServiceClient, env: [Environment.dev])
class MockLocationServiceClient implements LocationServiceClient {
  LocationServiceApi api = locator.get<LocationServiceApi>();

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
  ResponseFuture<LocationResponse> addLocation(LocationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, LocationResponse>(_addLocation(request)));
  }

  @override
  ResponseFuture<LocationResponse> getAllLocations(LocationRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, LocationResponse>(_getAllLocations(request)));
  }

  Future<LocationResponse> _getAllLocations(LocationRequest request) async {
    return LocationResponse()..locations.addAll(api.getAllLocations());
  }

  Future<LocationResponse> _addLocation(LocationRequest request) async {
    return LocationResponse()..locations.addAll(api.addLocation(request.location));
  }
}
