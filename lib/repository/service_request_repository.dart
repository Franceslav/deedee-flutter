import 'package:deedee/generated/request_service_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ServiceRequestRepository {
  final ServiceRequestServiceClient _requestServiceClient =
      locator.get<ServiceRequestServiceClient>();

  Future<ServiceRequest> accept(ServiceRequestRequest request,
      {CallOptions? options}) async {
    return (await _requestServiceClient.accept(request)).serviceRequest;
  }

  Future<ServiceRequest> change(ServiceRequestRequest request,
      {CallOptions? options}) async {
    return (await _requestServiceClient.change(request)).serviceRequest;
  }

  Future<ServiceRequest> create(ServiceRequestRequest request,
      {CallOptions? options}) async {
    return (await _requestServiceClient.create(request)).serviceRequest;
  }

  Future<ServiceRequest> delete(ServiceRequestRequest request,
      {CallOptions? options}) async {
    return (await _requestServiceClient.delete(request)).serviceRequest;
  }

  Future<List<ServiceRequest>> getAll(String userId,
      {CallOptions? options}) async {
    var response = await _requestServiceClient
        .getAll(ServiceRequestRequest()..userId = userId);
    return response.serviceRequests;
  }
}
