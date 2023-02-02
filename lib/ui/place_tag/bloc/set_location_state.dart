part of 'set_location_bloc.dart';

class SetLocationState {
  final StreamController<LatLng> streamController =
      StreamController<LatLng>.broadcast();
  final AddressModel? address;
  final List<AddressModel> addresses;
  bool isLoading;

  Stream<LatLng> get locationStream => streamController.stream;

  SetLocationState({
    this.address,
    this.addresses = const [],
    this.isLoading = false,
  });

  SetLocationState copyWith({
    AddressModel? address,
    List<AddressModel>? addresses,
    bool isLoading = false,
  }) {
    return SetLocationState(
      address: address ?? this.address,
      addresses: addresses ?? this.addresses,
      isLoading: isLoading,
    );
  }

  void addNewPosition(LatLng newPosition) {
    streamController.add(newPosition);
  }

  void dispose() {
    streamController.close();
  }
}
