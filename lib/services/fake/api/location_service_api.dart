import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/location.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class LocationServiceApi {
  late List<Location> _locations;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _locations = [
      Location(
          title: 'location 1',
          locationId: Int64(0),
          geolocation: Geolocation(
              latitude: 51.11, longitude: 51.11, title: 'geolocation1')),
      Location(
          title: 'location 2',
          locationId: Int64(1),
          geolocation: Geolocation(
              latitude: 51.11, longitude: 51.11, title: 'geolocation2')),
      Location(
          title: 'location 3',
          locationId: Int64(2),
          geolocation: Geolocation(
              latitude: 51.11, longitude: 51.11, title: 'geolocation3')),
      Location(
          title: 'location 4',
          locationId: Int64(3),
          geolocation: Geolocation(
              latitude: 51.11, longitude: 51.11, title: 'geolocation4'))
    ];
  }

  List<Location> addLocation(Location location) {
    _locations.add(location);
    return <Location>[location];
  }

  List<Location> getAllLocations() => _locations;
}
