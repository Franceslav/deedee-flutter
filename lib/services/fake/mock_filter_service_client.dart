import 'package:deedee/generated/filter_service.pbgrpc.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FilterServiceClient, env: [Environment.dev])
class MockFilterServiceClient implements FilterServiceClient {
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
  ResponseFuture<FilterResponse> addFilterToBookmarkedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    // TODO: implement addFilterToBookmarkedFilters
    throw UnimplementedError();
  }

  @override
  ResponseFuture<FilterResponse> addFilterToSubscribedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    // TODO: implement addFilterToSubscribedFilters
    throw UnimplementedError();
  }

  @override
  ResponseFuture<FilterResponse> editFilterInBookmarkedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    // TODO: implement editFilterInBookmarkedFilters
    throw UnimplementedError();
  }

  @override
  ResponseFuture<FilterResponse> editFilterInSubscribedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    // TODO: implement editFilterInSubscribedFilters
    throw UnimplementedError();
  }

  @override
  ResponseFuture<FilterResponse> removeFilterFilterBookmarkedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    // TODO: implement removeFilterFilterBookmarkedFilters
    throw UnimplementedError();
  }

  @override
  ResponseFuture<FilterResponse> removeFilterFromSubscribedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    // TODO: implement removeFilterFromSubscribedFilters
    throw UnimplementedError();
  }

  @override
  ResponseFuture<GetFilterKeysResponse> getFilterKeys(
      GetFilterKeysRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, GetFilterKeysResponse>(
        _getFilterKeys(request)));
  }

  Future<GetFilterKeysResponse> _getFilterKeys(
      GetFilterKeysRequest request) async {
    return GetFilterKeysResponse()
      ..filterKeys.addAll([
        FilterKey()
          ..topicId = "маникюр"
          ..title = "японский",
        FilterKey()
          ..topicId = "маникюр"
          ..title = "я",
        FilterKey()
          ..topicId = "маникюр"
          ..title = "ф",
      ]);
  }

  Future<Filter> _getBF(GetAllFiltersRequest request) async {
    return Filter(
      filterId: '1',
      topic: 'Клининг',
      filterKeys: [
        FilterKey()
          // ..topicId = "маникюр"
          ..title = "японский",
      ],
      bookmarked: false,
      subscribed: true,
    );
  }

  @override
  ResponseStream<Filter> getAllSubscribedFilters(GetAllFiltersRequest request,
      {CallOptions? options}) {
    return ResponseStream(
        FakeClientCall<dynamic, Filter>(_getAllSubscribedFilters(request)));
  }

  Future<Filter> _getAllSubscribedFilters(GetAllFiltersRequest request) async {
/*    var fakeStream = Stream<Filter>.periodic(
      const Duration(microseconds: 1),
      (computationCount) => Filter(
        topic: '$computationCount',
        bookmarked: true,
        subscribed: true,
      ),
    ).take(3) as ResponseStream<Filter>;
    return fakeStream;*/
    return Filter(
      topic: '1',
      bookmarked: true,
      subscribed: true,
    );
  }

  @override
  ResponseFuture<FilterResponse> removeBookmarkedFilter(FilterRequest request,
      {CallOptions? options}) {
    // TODO: implement removeBookmarkedFilter
    throw UnimplementedError();
  }

  @override
  ResponseStream<Filter> getAllBookmarkedFilters(GetAllFiltersRequest request,
      {CallOptions? options}) {
    // TODO: implement getAllBookmarkedFilters
    throw UnimplementedError();
  }
}
