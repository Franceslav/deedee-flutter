
import 'package:deedee/generated/LocationService.pb.dart';

abstract class AccountEvent {}

class LoadPlacesEvent extends AccountEvent {
  final GeoLocation geoLocation;
  final double radius;

  LoadPlacesEvent(this.geoLocation, this.radius);
}
