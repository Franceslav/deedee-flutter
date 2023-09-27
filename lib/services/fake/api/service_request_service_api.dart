import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/model/uuid.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ServiceRequestServiceApi {
  late List<ServiceRequest> _serviceRequests;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    var timestamp1 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime(2022,12).millisecondsSinceEpoch / 1000).round().toString());
    var timestamp2 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    var timestamp3 = Timestamp()
      ..seconds = Int64.parseInt(
           (DateTime(2023,3).millisecondsSinceEpoch / 1000).round().toString());
    var timestamp4 = Timestamp()
      ..seconds = Int64.parseInt(
           (DateTime(2023,5).millisecondsSinceEpoch / 1000).round().toString());

    _serviceRequests = [
      ServiceRequest(
        serviceRequestId: UUID(value: "58a78535-0852-4125-8a58-43843e4706a3"),
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
        serviceRequestId: UUID(value: "7616e064-338b-4ccc-bb36-45c4264e48ab"),
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
        serviceRequestId: UUID(value: "97a7ef1d-c62f-4649-9efd-e605e98e5519"),
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
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'маникюр 4',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'ron.x.by.su@gmail.com',
        createdFor: 'ron.x.by.su@gmail.com',
        createdAt: timestamp4,
        status: ServiceRequest_Status.DONE,
        price: 100,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "58a78535-0852-4125-8a58-43843e4706a4"),
        // tag: Tag()..topicId = 'маникюр 2',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'ron.x.by.su@gmail.com',
        createdFor: 'ron.x.by.su@gmail.com',
        status: ServiceRequest_Status.PENDING,
        createdAt: timestamp1,
        price: 100,
        tagId: Int64(1),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "7616e064-338b-4ccc-bb36-45c4264e48ab"),
        // tag: Tag()..topicId = 'маникюр 2',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'matveev.yakov@yahoo.com',
        createdFor: 'ron.x.by.su@gmail.com',
        createdAt: timestamp2,
        status: ServiceRequest_Status.PENDING,
        price: 100,
        tagId: Int64(2),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "97a7ef1d-c62f-4649-9efd-e605e98e5519"),
        // tag: Tag()..topicId = 'маникюр 3',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'matveev.yakov@yahoo.com',
        createdFor: 'ron.x.by.su@gmail.com',
        createdAt: timestamp3,
        status: ServiceRequest_Status.DELETED,
        price: 100,
        tagId: Int64(3),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'маникюр 4',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'temitylive@gmail.com',
        createdFor: 'ron.x.by.su@gmail.com',
        createdAt: timestamp4,
        status: ServiceRequest_Status.DONE,
        price: 100,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'маникюр 4',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'mybclym@gmail.com',
        createdFor: 'mybclym@gmail.com',
        createdAt: timestamp4,
        status: ServiceRequest_Status.DONE,
        price: 100,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'маникюр 4',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'mybclym@gmail.com',
        createdFor: 'mybclym@gmail.com',
        createdAt: timestamp3,
        status: ServiceRequest_Status.DONE,
        price: 100,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'маникюр 4',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'mybclym@gmail.com',
        createdFor: 'mybclym@gmail.com',
        createdAt: timestamp3,
        status: ServiceRequest_Status.DONE,
        price: 100,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'маникюр 4',
        description:
            'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        createdBy: 'mybclym@gmail.com',
        createdFor: 'mybclym@gmail.com',
        createdAt: timestamp3,
        status: ServiceRequest_Status.DONE,
        price: 100,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'мойка 5',
        description:
        'описание описание описание описание описание описание описание описание описание',
        createdBy: 'glshnkv@yandex.ru',
        createdFor: '',
        createdAt: timestamp3,
        status: ServiceRequest_Status.PENDING,
        price: 200,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'мойка 5',
        description:
        'описание описание описание описание описание описание описание описание описание',
        createdBy: 'glshnkv@yandex.ru',
        createdFor: '',
        createdAt: timestamp3,
        status: ServiceRequest_Status.PENDING,
        price: 250,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'мойка 5',
        description:
        'описание описание описание описание описание описание описание описание описание',
        createdBy: 'glshnkv@yandex.ru',
        createdFor: 'ron.x.by.su@gmail.com',
        createdAt: timestamp3,
        status: ServiceRequest_Status.PENDING,
        price: 200,
        tagId: Int64(4),
      ),
      ServiceRequest(
        serviceRequestId: UUID(value: "69b0be58-1e2e-4c3d-877e-2717a43b3492"),
        // tag: Tag()..topicId = 'мойка 5',
        description:
        'описание описание описание описание описание описание описание описание описание',
        createdBy: 'glshnkv@yandex.ru',
        createdFor: '',
        createdAt: timestamp3,
        status: ServiceRequest_Status.DONE,
        price: 300,
        tagId: Int64(4),
      ),

    ];
  }

  List<ServiceRequest> getServiceRequests(String userId) {
    return _serviceRequests.filter((sr) => sr.createdBy == userId).toList();
  }

  ServiceRequest create(ServiceRequest request) {
    request.serviceRequestId =
        UUID(value: const Uuid().v5(Uuid.NAMESPACE_URL, 'www.deedee.com'));
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
      ..status = serviceRequest.status;
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
