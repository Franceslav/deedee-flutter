import 'dart:math';

import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/service/service_request_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ServiceRequestRepository {
  final ServiceRequestServiceClient _requestServiceClient =
      locator.get<ServiceRequestServiceClient>();

  Future<ServiceRequest> accept(ServiceRequest serviceRequest) async {
    var response = await _requestServiceClient.accept(
      ServiceRequestRequest(serviceRequest: serviceRequest),
    );
    return response.serviceRequests
        .firstWhere((element) => element == serviceRequest);
  }

  Future<ServiceRequest> change(
      ServiceRequest currentRequest, ServiceRequest newRequest /*TODO*/) async {
    var response = await _requestServiceClient.change(
      ServiceRequestRequest(serviceRequest: currentRequest),
    );
    return response.serviceRequests
        .firstWhere((element) => element == currentRequest);
  }

  Future<ServiceRequest> create(ServiceRequest serviceRequest) async {
    var response = await _requestServiceClient.create(
      ServiceRequestRequest(serviceRequest: serviceRequest),
    );
    return response.serviceRequests
        .firstWhere((element) => element == serviceRequest);
  }

  Future<ServiceRequest> delete(ServiceRequest serviceRequest) async {
    var response = await _requestServiceClient.delete(
      ServiceRequestRequest(serviceRequest: serviceRequest),
    );
    return response.serviceRequests.firstWhere((element) =>
        element.serviceRequestId == serviceRequest.serviceRequestId);
  }

  Future<List<ServiceRequest>> getAll(String userId) async {
    var response = await _requestServiceClient.getAll(
      ServiceRequestRequest(
        serviceRequest: ServiceRequest(
          createdFor: userId,
        ),
      ),
    );
    return response.serviceRequests;
  }
}
