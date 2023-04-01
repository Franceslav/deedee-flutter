import 'dart:io';
import 'dart:ui';

import 'package:deedee/generated/filter_service.pbgrpc.dart';
import 'package:deedee/generated/request_service_service.pbgrpc.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ServiceRequestServiceClient, env: [Environment.dev])
class MockServiceRequestServiceClient implements ServiceRequestServiceClient {
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
    // TODO: implement accept
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ServiceRequestResponse> change(ServiceRequestRequest request,
      {CallOptions? options}) {
    // TODO: implement change
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ServiceRequestResponse> create(ServiceRequestRequest request,
      {CallOptions? options}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ServiceRequestResponse> delete(ServiceRequestRequest request,
      {CallOptions? options}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ServiceRequestsResponse> getAll(ServiceRequestRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, ServiceRequestsResponse>(
        _getAll(request)));
  }

  Future<ServiceRequestsResponse> _getAll(ServiceRequestRequest request) async {
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
    var _requests = [
      ServiceRequest(
        requestId: '2',
        // tag: Tag()..topicId = 'маникюр 2',
        description:
        'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        clientId: 'customer Name',
        status: ServiceRequest_Status.PENDING,
        dateOfRequest: timestamp1,
        price: 100,
      ),
      ServiceRequest(
        requestId: '2',
        // tag: Tag()..topicId = 'маникюр 2',
        description:
        'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        clientId: 'customer Name',
        dateOfRequest: timestamp2,
        status: ServiceRequest_Status.PENDING,
        price: 100,
      ),
      ServiceRequest(
        requestId: '3',
        // tag: Tag()..topicId = 'маникюр 3',
        description:
        'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        clientId: 'customer Name',
        dateOfRequest: timestamp3,
        status: ServiceRequest_Status.PENDING,
        price: 100,
      ),
      ServiceRequest(
        requestId: '4',
        // tag: Tag()..topicId = 'маникюр 4',
        description:
        'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
        clientId: 'customer Name',
        dateOfRequest: timestamp4,
        status: ServiceRequest_Status.PENDING,
        price: 100,
      ),
    ];

    return ServiceRequestsResponse()..serviceRequests.addAll(_requests);
  }

}

