import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';
import 'package:deedee/generated/deedee/api/service/composite_filter_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class CompositeFilterRepository {
  final CompositeFilterServiceClient _compositeFilterServiceClient =
      locator.get<CompositeFilterServiceClient>();

  Future<List<FilterKey>> getFilterKeys(String subtopic) async {
    var response = await _compositeFilterServiceClient.getFilterKeys(
      FilterKeyRequest(
        filterKey: FilterKey(
          subtopicId: subtopic,
        ),
      ),
    );
    return response.filterKeys;
  }

  Future<CompositeFilter> addToFavorites(
      CompositeFilter compositeFilter) async {
    final response = await _compositeFilterServiceClient.addToFavorites(
      CompositeFilterRequest(
        compositeFilter: CompositeFilter(
          compositeFilterId: compositeFilter.compositeFilterId,
          userId: compositeFilter.userId,
          topic: compositeFilter.topic,
          filterMap: compositeFilter.filterMap,
          status: compositeFilter.status,
          title: compositeFilter.title,
        ),
      ),
    );
    return response.compositeFilters
        .firstWhere((element) => element == compositeFilter);
  }

  Future<CompositeFilter> editFavorites(Int64 compositeFilterId) async {
    final response = await _compositeFilterServiceClient.editFavorites(
      CompositeFilterRequest(
        compositeFilter: CompositeFilter(
          compositeFilterId: compositeFilterId,
        ),
      ),
    );
    return response.compositeFilters.firstWhere(
        (element) => element.compositeFilterId == compositeFilterId);
  }

  Future<List<CompositeFilter>> getAllFavorites(userId) async {
    final response = await _compositeFilterServiceClient.getAllFavorites(
      CompositeFilterRequest(
        compositeFilter: CompositeFilter(
          userId: userId,
        ),
      ),
    );
    return response.compositeFilters;
  }

  Future<CompositeFilter> removeFromFavorites(Int64 compositeFilterId) async {
    final response = await _compositeFilterServiceClient.removeFromFavorites(
      CompositeFilterRequest(
        compositeFilter: CompositeFilter(
          compositeFilterId: compositeFilterId,
        ),
      ),
    );
    return response.compositeFilters.firstWhere(
        (element) => element.compositeFilterId == compositeFilterId);
  }
}
