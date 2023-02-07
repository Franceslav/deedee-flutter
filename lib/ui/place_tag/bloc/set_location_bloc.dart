import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:search_address_repository/search_address_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:stream_transform/stream_transform.dart';

part 'set_location_event.dart';
part 'set_location_state.dart';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class SetLocationBloc extends Bloc<SetLocationEvent, SetLocationState> {
  late final SearchAddressRepository _searchAddressRepository;

  SetLocationBloc({required SearchAddressRepository searchAddressRepository})
      : _searchAddressRepository = searchAddressRepository,
        super(SetLocationState()) {
    on<SearchAddressByLocation>(_onSearchAddressByLocation);
    on<SearchLocationByAddress>(_onSearchLocationByAddress);
    on<CenterPositionChanged>(_onCenterPositionChanged);
  }

  _onSearchAddressByLocation(
      SearchAddressByLocation event, Emitter<SetLocationState> emit) async {
    final address =
        await _searchAddressRepository.onLocationSearch(event.location);
    emit(state.copyWith(address: address));
  }

  _onSearchLocationByAddress(
      SearchLocationByAddress event, Emitter<SetLocationState> emit) async {
    if (event.query.length < 3) {
      return emit(state.copyWith(addresses: []));
    }
    emit(state.copyWith(isLoading: true));
    final addresses =
        await _searchAddressRepository.onAddressSearch(event.query);
    emit(state.copyWith(addresses: addresses));
  }

  _onCenterPositionChanged(
      CenterPositionChanged event, Emitter<SetLocationState> emit) {
    state.addNewPosition(event.newPosition);
  }

  @override
  Future<void> close() {
    state.dispose();
    return super.close();
  }
}
