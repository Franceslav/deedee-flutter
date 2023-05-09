import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:deedee/generated/deedee/api/service/location_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class LocationRepository {
  final _locationServiceClient = locator.get<LocationServiceClient>();

  Future<void> addLocation(Location location) async {
    await _locationServiceClient
        .addLocation(LocationRequest(location: location));
  }

  Future<List<Location>> getAllLocations() async {
    final response =
        await _locationServiceClient.getAllLocations(LocationRequest());
    return response.locations;
  }
}
