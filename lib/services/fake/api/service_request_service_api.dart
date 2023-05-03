import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ServiceRequestServiceApi {
  late List<ServiceRequest> _serviceRequests;

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

    _serviceRequests = [
      ServiceRequest(
        serviceRequestId: Int64(1),
        // tag: Tag()..topicId = 'маникюр 2',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'ron.x.by.su@gmail.com',
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
        createdBy: 'ron.x.by.su@gmail.com',
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
        createdBy: 'ron.x.by.su@gmail.com',
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
        createdBy: 'ron.x.by.su@gmail.com',
        createdFor: '',
        createdAt: timestamp4,
        status: ServiceRequest_Status.DONE,
        price: 100,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: Int64(1),
        // tag: Tag()..topicId = 'маникюр 2',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'art.zavtur@gmail.com',
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
    ];
  }

  List<ServiceRequest> getServiceRequests(String userId) {
    return _serviceRequests.filter((sr) => sr.createdBy == userId).toList();
  }

  ServiceRequest create(ServiceRequest request) {
    request.serviceRequestId = Int64(DateTime.now().microsecondsSinceEpoch);
    _serviceRequests.add(request);
    return request;
  }

  ServiceRequest change(ServiceRequest serviceRequest) {
    return _serviceRequests.firstWhere(
        (rq) => rq.serviceRequestId == serviceRequest.serviceRequestId)
      ..description = serviceRequest.description
      ..price = serviceRequest.price;
  }

  ServiceRequest accept(ServiceRequest serviceRequest) {
    return _serviceRequests.firstWhere((rq) =>
        rq.serviceRequestId == serviceRequest.serviceRequestId &&
        rq.createdBy == serviceRequest.createdBy)
      ..status = ServiceRequest_Status.ACCEPTED;
  }

  ServiceRequest decline(ServiceRequest serviceRequest) {
    return _serviceRequests.firstWhere((rq) =>
        rq.serviceRequestId == serviceRequest.serviceRequestId &&
        rq.createdBy == serviceRequest.createdBy)
      ..status = ServiceRequest_Status.DECLINED;
  }

  ServiceRequest delete(ServiceRequest serviceRequest) {
    return _serviceRequests.firstWhere((rq) =>
        rq.serviceRequestId == serviceRequest.serviceRequestId &&
        rq.createdBy == serviceRequest.createdBy)
      ..status = ServiceRequest_Status.DELETED;
  }

  ServiceRequest update(userId, ServiceRequest request) {
    //TODO:
    return _serviceRequests.firstWhere(
      (rq) => rq.serviceRequestId == request.serviceRequestId,
      orElse: () => request,
    )
      ..status = ServiceRequest_Status.CHANGED
      ..price = request.price
      ..description = request.description
      ..createdAt = request.createdAt;
  }
}
