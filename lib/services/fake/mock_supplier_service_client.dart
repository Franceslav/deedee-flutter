import 'package:deedee/generated/deedee/api/service/supplier_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/supplier_service_api.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

import 'fake_client.dart';

@LazySingleton(as: SupplierServiceClient, env: [Environment.dev])
class MockSupplierServiceClient implements SupplierServiceClient {
  // AccountBloc bloc = AccountBloc();

  SupplierServiceApi api = locator.get<SupplierServiceApi>();

  @override
  ResponseFuture<SupplierResponse> createSupplierEntity(SupplierRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, SupplierResponse>(_create(request)));
  }

  Future<SupplierResponse> _create(SupplierRequest request) async {
    return SupplierResponse(
      suppliers: [await api.createSupplier(request.supplier)],
    );
  }

  @override
  ResponseFuture<SupplierResponse> deleteSupplierEntity(SupplierRequest request,
      {CallOptions? options}) {
    // TODO: implement deleteSupplierEntity
    throw UnimplementedError();
  }

  @override
  ResponseFuture<SupplierResponse> getSupplierEntities(SupplierRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, SupplierResponse>(_get(request)));
  }

  Future<SupplierResponse> _get(SupplierRequest request) async {
    return SupplierResponse(
      suppliers: [await api.getSupplier(request.supplier.supplierId)],
    );
  }

  @override
  ResponseFuture<SupplierResponse> getSupplierEntityById(
      SupplierRequest request,
      {CallOptions? options}) {
    // // TODO: implement getSupplierEntityById
    throw UnimplementedError();
    // return SupplierResponse()..suppliers.add(api.getSupplier(request.supplier.supplierId));
    // ..filterKeys.addAll(api.getFilterKeys(request.filterKey.subtopicId));
  }

  @override
  ResponseFuture<SupplierResponse> modifySupplierEntity(SupplierRequest request,
      {CallOptions? options}) {
    // TODO: implement modifySupplierEntity
    throw UnimplementedError();
  }

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
}
