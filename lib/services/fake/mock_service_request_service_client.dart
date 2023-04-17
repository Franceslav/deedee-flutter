import 'package:deedee/generated/request_service_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/service_request_repository.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ServiceRequestServiceClient, env: [Environment.dev])
class MockServiceRequestServiceClient implements ServiceRequestServiceClient {
  ServiceRequestServiceApi api = locator.get<ServiceRequestServiceApi>();

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
  ResponseFuture<ServiceRequestResponse> accept(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ServiceRequestResponse>(_accept(request)));
  }

  Future<ServiceRequestResponse> _accept(ServiceRequestRequest request) async {
    return ServiceRequestResponse()
      ..serviceRequest = api.accept(
        request.userId,
        request.serviceRequest.requestId,
      );
  }

  @override
  ResponseFuture<ServiceRequestResponse> change(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ServiceRequestResponse>(_change(request)));
  }

  Future<ServiceRequestResponse> _change(ServiceRequestRequest request) async {
    return ServiceRequestResponse()
      ..serviceRequest =
          api.change(request.userId, request.serviceRequest.requestId, '', 0);
  }

  @override
  ResponseFuture<ServiceRequestResponse> create(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ServiceRequestResponse>(_create(request)));
  }

  Future<ServiceRequestResponse> _create(ServiceRequestRequest request) async {
    return ServiceRequestResponse()
      ..serviceRequest = api.create(request.userId);
  }

  @override
  ResponseFuture<ServiceRequestResponse> delete(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ServiceRequestResponse>(_delete(request)));
  }

  Future<ServiceRequestResponse> _delete(ServiceRequestRequest request) async {
    return ServiceRequestResponse()
      ..serviceRequest = api.delete(
        request.userId,
        request.serviceRequest.requestId,
      );
  }

  @override
  ResponseFuture<ServiceRequestsResponse> getAll(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ServiceRequestsResponse>(_getAll(request)));
  }

  Future<ServiceRequestsResponse> _getAll(ServiceRequestRequest request) async {
    return ServiceRequestsResponse()
      ..serviceRequests.addAll(api.getServiceRequests(request.userId));
  }
}
