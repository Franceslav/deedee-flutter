import 'package:deedee/generated/deedee/api/service/composite_filter_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/composite_filter_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:deedee/ui/page/account/account_bloc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CompositeFilterServiceClient, env: [Environment.dev])
class MockCompositeFilterServiceClient implements CompositeFilterServiceClient {
  AccountBloc bloc = AccountBloc();

  CompositeFilterServiceApi api = locator.get<CompositeFilterServiceApi>();

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
  ResponseFuture<FilterKeyResponse> getFilterKeys(FilterKeyRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
        FakeClientCall<dynamic, FilterKeyResponse>(_getFilterKeys(request)));
  }

  Future<FilterKeyResponse> _getFilterKeys(FilterKeyRequest request) async {
    return FilterKeyResponse()
      ..filterKeys.addAll(api.getFilterKeys(request.filterKey.subtopicId));
  }

  @override
  ResponseFuture<CompositeFilterResponse> removeBookmarkedFilter(
      CompositeFilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, CompositeFilterResponse>(
        _deleteCompositeFilter(request)));
  }

  Future<CompositeFilterResponse> _deleteCompositeFilter(
      CompositeFilterRequest request) async {
    var filter =
        api.deleteCompositeFilter(request.compositeFilter.userId, Int64());
    return CompositeFilterResponse()..compositeFilters.first = filter;
  }

  @override
  ResponseFuture<CompositeFilterResponse> addToFavorites(
      CompositeFilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, CompositeFilterResponse>(
        _addToFavorites(request)));
  }

  Future<CompositeFilterResponse> _addToFavorites(
      CompositeFilterRequest request) async {
    var filter = api.createCompositeFilter(request.compositeFilter);
    return CompositeFilterResponse()..compositeFilters.first = filter;
  }

  @override
  ResponseFuture<CompositeFilterResponse> editFavorites(
      CompositeFilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, CompositeFilterResponse>(
        _editFavorites(request)));
  }

  Future<CompositeFilterResponse> _editFavorites(
      CompositeFilterRequest request) async {
    var filter = api.updateCompositeFilter(
        '', Int64(), request.compositeFilter.filterMap);
    return CompositeFilterResponse()..compositeFilters.first = filter;
  }

  @override
  ResponseFuture<CompositeFilterResponse> removeFromFavorites(
      CompositeFilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, CompositeFilterResponse>(
        _removeFromFavorites(request)));
  }

  Future<CompositeFilterResponse> _removeFromFavorites(
      CompositeFilterRequest request) async {
    return CompositeFilterResponse()
      ..compositeFilters.addAll([
        api.deleteCompositeFilter(request.compositeFilter.userId,
            request.compositeFilter.compositeFilterId)
      ]);
  }

  @override
  ResponseFuture<CompositeFilterResponse> getAllFavorites(
      CompositeFilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, CompositeFilterResponse>(
        _getAllFavorites(request)));
  }

  Future<CompositeFilterResponse> _getAllFavorites(
      CompositeFilterRequest request) async {
    return CompositeFilterResponse()
      ..compositeFilters
          .addAll(api.readCompositeFilter(request.compositeFilter.userId));
  }
}
