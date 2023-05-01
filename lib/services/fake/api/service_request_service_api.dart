import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
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
          serviceRequestId: Int64(1),
          // tag: Tag()..topicId = 'маникюр 2',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          createdBy: '1',
          createdFor: '',
          status: ServiceRequest_Status.PENDING,
          createdAt: timestamp1,
          price: 100,
          tagId: Int64(1),
        ),
        ServiceRequest(
          serviceRequestId: Int64(2),
          // tag: Tag()..topicId = 'маникюр 2',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          createdBy: '2',
          createdFor: '',
          createdAt: timestamp2,
          status: ServiceRequest_Status.PENDING,
          price: 100,
          tagId: Int64(2),
        ),
        ServiceRequest(
          serviceRequestId: Int64(3),
          // tag: Tag()..topicId = 'маникюр 3',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          createdBy: '3',
          createdFor: '',
          createdAt: timestamp3,
          status: ServiceRequest_Status.DELETED,
          price: 100,
          tagId: Int64(3),
        ),
        ServiceRequest(
          serviceRequestId: Int64(4),
          // tag: Tag()..topicId = 'маникюр 4',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          createdBy: '4',
          createdFor: '',
          createdAt: timestamp4,
          status: ServiceRequest_Status.DONE,
          price: 100,
          tagId: Int64(4),
        ),
      ],
      "1": [
        ServiceRequest(
          serviceRequestId: Int64(1),
          // tag: Tag()..topicId = 'маникюр 2',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          createdBy: '1',
          createdFor: '',
          status: ServiceRequest_Status.PENDING,
          createdAt: timestamp1,
          price: 100,
          tagId: Int64(1),
        ),
        ServiceRequest(
          serviceRequestId: Int64(2),
          // tag: Tag()..topicId = 'маникюр 2',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          createdBy: '2',
          createdFor: '',
          createdAt: timestamp2,
          status: ServiceRequest_Status.PENDING,
          price: 100,
          tagId: Int64(2),
        ),
        ServiceRequest(
          serviceRequestId: Int64(3),
          // tag: Tag()..topicId = 'маникюр 3',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          createdBy: '3',
          createdFor: '',
          createdAt: timestamp3,
          status: ServiceRequest_Status.DELETED,
          price: 100,
          tagId: Int64(3),
        ),
        ServiceRequest(
          serviceRequestId: Int64(4),
          // tag: Tag()..topicId = 'маникюр 4',
          description:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
          createdBy: '4',
          createdFor: '',
          createdAt: timestamp4,
          status: ServiceRequest_Status.DONE,
          price: 100,
          tagId: Int64(4),
        ),
      ]
    };
  }

  List<ServiceRequest> getServiceRequests(String userId) {
    return _serviceRequests.getOrElse(userId, () => []);
  }

  ServiceRequest create(ServiceRequest request) {
    request.serviceRequestId = Int64(DateTime.now().microsecondsSinceEpoch);
    _serviceRequests.getOrElse(request.createdFor, () => []).add(request);
    return request;
  }

  ServiceRequest change(String userId, String serviceRequestId,
      String description, double price) {
    return _serviceRequests
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.serviceRequestId == serviceRequestId)
      ..description = description
      ..price = price;
  }

  ServiceRequest accept(userId, serviceRequestId) {
    return _serviceRequests
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.serviceRequestId == serviceRequestId)
      ..status = ServiceRequest_Status.ACCEPTED;
  }

  ServiceRequest delete(String userId, Int64 serviceRequestId) {
    return _serviceRequests
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.serviceRequestId == serviceRequestId)
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
          (rq) => rq.serviceRequestId == request.serviceRequestId,
          orElse: () => request,
        )
      ..status = ServiceRequest_Status.CHANGED
      ..price = request.price
      ..description = request.description
      ..createdAt = request.createdAt;
  }

  ServiceRequest decline(userId, serviceRequestId) {
    return _serviceRequests
        .getOrElse(userId, () => [])
        .firstWhere((rq) => rq.serviceRequestId == serviceRequestId)
      ..status = ServiceRequest_Status.ACCEPTED;
  }
}
