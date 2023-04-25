import 'package:deedee/generated/deedee/api/service/service_request_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/service_request_service_api.dart';
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
      ..serviceRequests.first = api.accept(
        request.serviceRequest.createdBy,
        request.serviceRequest.serviceRequestId,
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
      ..serviceRequests.first = api.change(request.serviceRequest.createdBy,
          request.serviceRequest.serviceRequestId.toString(), '', 0);
  }

  @override
  ResponseFuture<ServiceRequestResponse> create(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ServiceRequestResponse>(_create(request)));
  }

  Future<ServiceRequestResponse> _create(ServiceRequestRequest request) async {
    return ServiceRequestResponse()
      ..serviceRequests.first = api.create(request.serviceRequest);
  }

  @override
  ResponseFuture<ServiceRequestResponse> delete(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ServiceRequestResponse>(_delete(request)));
  }

  Future<ServiceRequestResponse> _delete(ServiceRequestRequest request) async {
    return ServiceRequestResponse()
      ..serviceRequests.first = api.delete(
        request.serviceRequest.createdFor,
        request.serviceRequest.serviceRequestId,
      );
  }

  @override
  ResponseFuture<ServiceRequestResponse> getAll(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, ServiceRequestResponse>(_getAll(request)));
  }

  Future<ServiceRequestResponse> _getAll(ServiceRequestRequest request) async {
    return ServiceRequestResponse()
      ..serviceRequests
          .addAll(api.getServiceRequests(request.serviceRequest.createdFor));
  }

  @override
  ResponseFuture<ServiceRequestResponse> decline(ServiceRequestRequest request,
      {CallOptions? options}) {
    // TODO: implement decline
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ServiceRequestResponse> modify(ServiceRequestRequest request,
      {CallOptions? options}) {
    // TODO: implement modify
    throw UnimplementedError();
  }
}
