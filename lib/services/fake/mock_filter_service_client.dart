import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:deedee/generated/filter_service.pbgrpc.dart';
import 'package:deedee/generated/topic_service.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/filter_repository.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';
import 'package:deedee/ui/page/account/account_bloc.dart';

@LazySingleton(as: FilterServiceClient, env: [Environment.dev])
class MockFilterServiceClient implements FilterServiceClient {
  AccountBloc bloc = AccountBloc();

  FilterServiceApi api = locator.get<FilterServiceApi>();

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
    return ResponseFuture(FakeClientCall<dynamic, FilterResponse>(
        _createCompositeFilter(request)));
  }

  Future<FilterResponse> _createCompositeFilter(FilterRequest request) async {
    var filter = api.createCompositeFilter(
      userId: '',
      filterId: Int64(),
      topic: Topic(),
      subtopic: 'subtopic',
      filterKeys: [],
      status: CompositeFilter_Status.BOOKMARKED,
    );
    return FilterResponse()..filter = Filter();
  }

  @override
  ResponseFuture<FilterResponse> addFilterToSubscribedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, FilterResponse>(
        _addFilterToSubscribedFilters(request)));
  }

  Future<FilterResponse> _addFilterToSubscribedFilters(
      FilterRequest request) async {
    return FilterResponse()..filter = Filter();
  }

  @override
  ResponseFuture<FilterResponse> editFilterInBookmarkedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, FilterResponse>(
        _updateCompositeFilter(request)));
  }

  Future<FilterResponse> _updateCompositeFilter(FilterRequest request) async {
    var filter = api.updateCompositeFilter(
      '',
      Int64(),
      request.filter.subtopic,
      request.filter.filterKeys,
    );
    return FilterResponse()..filter = Filter();
  }

  @override
  ResponseFuture<FilterResponse> editFilterInSubscribedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, FilterResponse>(
        _editFilterInSubscribedFilters(request)));
  }

  Future<FilterResponse> _editFilterInSubscribedFilters(
      FilterRequest request) async {
    return FilterResponse()..filter = Filter();
  }

  @override
  ResponseFuture<FilterResponse> removeFilterFromSubscribedFilters(
      FilterRequest request,
      {CallOptions? options}) {
    return ResponseFuture(FakeClientCall<dynamic, FilterResponse>(
        _removeFilterFromSubscribedFilters(request)));
  }

  Future<FilterResponse> _removeFilterFromSubscribedFilters(
      FilterRequest request) async {
    return FilterResponse()..filter = Filter();
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
    // String deviceLanguage =  bloc.appLocal?.languageCode ?? Platform.localeName.substring(0, 2);

    return GetFilterKeysResponse()
      ..filterKeys.addAll(api.getFilterKeys(request.topicId));
  }

  Future<Filter> _getBF(GetAllFiltersRequest request) async {
    return Filter(
      filterId: '1',
      topic: 'Клининг',
      filterKeys: [
        FilterKey()
          // ..subtopicId = "маникюр"
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
    return ResponseFuture(FakeClientCall<dynamic, FilterResponse>(
        _deleteCompositeFilter(request)));
  }

  Future<FilterResponse> _deleteCompositeFilter(FilterRequest request) async {
    var filter = api.deleteCompositeFilter(request.filter.userId, Int64());
    return FilterResponse()..filter = Filter();
  }

  @override
  ResponseStream<Filter> getAllBookmarkedFilters(GetAllFiltersRequest request,
      {CallOptions? options}) {
    return ResponseStream(
        FakeClientCall<dynamic, Filter>(_readCompositeFilter(request)));
  }

  Future<Filter> _readCompositeFilter(GetAllFiltersRequest request) async {
    var filter = api.readCompositeFilter(request.userId);
    return Filter();
  }
}
