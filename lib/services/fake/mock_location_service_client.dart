import 'package:deedee/constants.dart';
import 'package:deedee/generated/LocationService.pbgrpc.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocationServiceClient, env: [Environment.dev])
class MockLocationServiceClient implements LocationServiceClient {
  @override
  ClientCall<Q, R> $createCall<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request, {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<GetPlacesResponse> getPlaces(GetPlacesRequest request, {CallOptions? options}) {
    // TODO: implement getPlaces
    throw UnimplementedError();
  }
}
