import 'package:deedee/generated/filter_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class FilterRepository {
  final FilterServiceClient _filterServiceClient =
      locator.get<FilterServiceClient>();

  Future<List<FilterKey>> getFilterItems(String topic) async {
    var response = await _filterServiceClient
        .getFilterKeys(GetFilterKeysRequest()..topicId = topic);
    return response.filterKeys;
  }

  Future<ResponseStream<Filter>> getUserSavedFilters(String userId) async {
    final response = await _filterServiceClient
        .getAllBookmarkedFilters(GetAllFiltersRequest()..userId = userId);
    return response;
  }

  Future<ResponseStream<Filter>> getFilterSubscriptions(String userId) async {
    final response = await _filterServiceClient
        .getAllSubscribedFilters(GetAllFiltersRequest()..userId = userId);
    return response;
  }

  Future<CompositeFilter> addFilterSubscriptionElement(CompositeFilter compositeFilter) async {
    var response = await _filterServiceClient
        .addFilterToSubscribedFilters(FilterRequest()..filter = Filter());

    throw UnimplementedError();
    // return response.filter;
  }

  Future<CompositeFilter> removeFilterSubscriptionElement(CompositeFilter compositeFilter) async {
    var response = await _filterServiceClient
        .removeFilterFromSubscribedFilters(FilterRequest()..filter = Filter());

    throw UnimplementedError();
    // return response.filter;
  }

  Future<CompositeFilter> editFilterSubscriptionElement(CompositeFilter compositeFilter) async {
    var response = await _filterServiceClient
        .removeFilterFromSubscribedFilters(FilterRequest()..filter = Filter());

    throw UnimplementedError();
    // return response.filter;
  }
}
