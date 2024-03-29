import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/model/uuid.pb.dart';
import 'package:deedee/generated/deedee/api/service/service_request_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ServiceRequestRepository {
  final ServiceRequestServiceClient _requestServiceClient =
      locator.get<ServiceRequestServiceClient>();

  Future<ServiceRequest> accept(
      ServiceRequest serviceRequest, String email) async {
    var response = await _requestServiceClient.accept(
      ServiceRequestRequest(
        serviceRequest: ServiceRequest(
            status: serviceRequest.status,
            serviceRequestId: serviceRequest.serviceRequestId,
            createdBy: email),
      ),
    );
    return response.serviceRequests.firstWhere((element) =>
        element.serviceRequestId == serviceRequest.serviceRequestId);
  }

  Future<ServiceRequest> decline(
      ServiceRequest serviceRequest, String email) async {
    var response = await _requestServiceClient.decline(
      ServiceRequestRequest(
        serviceRequest: ServiceRequest(
            serviceRequestId: serviceRequest.serviceRequestId,
            createdBy: email),
      ),
    );
    return response.serviceRequests.firstWhere((element) =>
        element.serviceRequestId == serviceRequest.serviceRequestId);
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
      ServiceRequestRequest(
        serviceRequest: ServiceRequest(
          createdFor: serviceRequest.createdFor,
          createdBy: serviceRequest.createdBy,
          description: serviceRequest.description,
          createdAt: serviceRequest.createdAt,
          geolocation: serviceRequest.geolocation,
          price: serviceRequest.price,
          status: serviceRequest.status,
          tagId: serviceRequest.tagId,
        ),
      ),
    );
    return response.serviceRequests.first;
  }

  Future<ServiceRequest> delete(UUID serviceRequestId, String email) async {
    var response = await _requestServiceClient.delete(
      ServiceRequestRequest(
        serviceRequest: ServiceRequest(
            serviceRequestId: serviceRequestId, createdBy: email),
      ),
    );
    return response.serviceRequests
        .firstWhere((element) => element.serviceRequestId == serviceRequestId);
  }

  Future<List<ServiceRequest>> getAll(String email) async {
    var response = await _requestServiceClient.getAll(
      ServiceRequestRequest(
        serviceRequest: ServiceRequest(
          createdFor: email,
        ),
      ),
    );
    return response.serviceRequests;
  }

  Future<List<ServiceRequest>> getByServiceRequestId(String userId, UUID serviceRequestId) async {
    var response = await _requestServiceClient.getAll(
      ServiceRequestRequest(
        serviceRequest: ServiceRequest(
          serviceRequestId: serviceRequestId,
          createdFor: userId,
        ),
      ),
    );
    return response.serviceRequests;
  }
}
