import 'package:dartx/dartx.dart';
import 'package:deedee/generated/request_service_service.pb.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ServiceRequestServiceApi {
  late Map<String, List<ServiceRequest>> _serviceRequests;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    var timestamp1 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    var timestamp2 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    var timestamp3 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    var timestamp4 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    _serviceRequests = {
      "": [
        ServiceRequest(
          requestId: '1',
          // tag: Tag()..topicId = 'маникюр 2',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          clientId: 'Vasia Pupkin',
          status: ServiceRequest_Status.PENDING,
          dateOfRequest: timestamp1,
          price: 100,
        ),
        ServiceRequest(
          requestId: '2',
          // tag: Tag()..topicId = 'маникюр 2',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          clientId: 'Ivan  Ivanov',
          dateOfRequest: timestamp2,
          status: ServiceRequest_Status.PENDING,
          price: 100,
        ),
        ServiceRequest(
          requestId: '3',
          // tag: Tag()..topicId = 'маникюр 3',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          clientId: 'John Smith',
          dateOfRequest: timestamp3,
          status: ServiceRequest_Status.DELETED,
          price: 100,
        ),
        ServiceRequest(
          requestId: '4',
          // tag: Tag()..topicId = 'маникюр 4',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          clientId: 'Joe Biden',
          dateOfRequest: timestamp4,
          status: ServiceRequest_Status.DONE,
          price: 100,
        ),
      ]
    };
  }

  List<ServiceRequest> getServiceRequests(String userId) {
    return _serviceRequests.getOrElse(userId, () => []);
  }

  ServiceRequest create(ServiceRequest request) {
    _serviceRequests[request.clientId]!.add(request);
    return request;
  }

  ServiceRequest change(
      String userId, String requestId, String description, double price) {
    return _serviceRequests
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.requestId == requestId)
      ..description = description
      ..price = price;
  }

  ServiceRequest accept(userId, requestId) {
    return _serviceRequests
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.requestId == requestId)
      ..status = ServiceRequest_Status.ACCEPTED;
  }

  ServiceRequest delete(userId, requestId) {
    return _serviceRequests
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.requestId == requestId)
      ..status = ServiceRequest_Status.DELETED;
  }

  ServiceRequest update(userId, ServiceRequest request) {
    return _serviceRequests
        .update(
          userId,
          (value) => value,
          ifAbsent: () => [],
        )
        .firstWhere(
          (rq) => rq.requestId == request.requestId,
          orElse: () => request,
        )
      ..status = ServiceRequest_Status.CHANGED
      ..price = request.price
      ..description = request.description
      ..dateOfRequest = request.dateOfRequest;
  }
}
