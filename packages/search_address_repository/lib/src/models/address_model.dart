import 'package:latlong2/latlong.dart';

class AddressModel {
  final int? id;
  final String? address;
  final LatLng? location;

  AddressModel({
    this.id,
    this.address,
    this.location,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    LatLng? location;
    if (double.tryParse(json['lat']) != null &&
        double.tryParse(json['lon']) != null) {
      location =
          LatLng(double.tryParse(json['lat'])!, double.tryParse(json['lon'])!);
    }
    return AddressModel(
      id: json['place_id'],
      address: json['display_name'],
      location: location,
    );
  }
}
