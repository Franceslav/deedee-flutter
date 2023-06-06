// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/composite_filter.pb.dart';

import 'package:deedee/model/order.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/tag_repository.dart';
import 'package:latlong2/latlong.dart';

import '../../../injection.dart';
import '../../../services/grpc.dart';

part 'place_order_event.dart';
part 'place_order_state.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  final TagRepository _tagRepository;
  final User _user;

  PlaceOrderBloc(
    this._tagRepository,
    this._user,
  ) : super(PlaceBidInitial()) {
    on<PlaceOrderSetValueEvent>(_setValue);
    on<PlaceOrderRequestEvent>(_placeOrder);
  }

  FutureOr<void> _placeOrder(PlaceOrderRequestEvent event, emit) async {
    try {
      final order = await _tagRepository.placeTag(
          _user.email,
          _user.email,
          event.topic,
          event.filterMap,
          event.location.latitude,
          event.location.longitude,
          event.topicId);

      print('Lenght-> ${order.length} <-Lenght');
      print(order.last.tagId);
      print(order.last.compositeFilter.topic.title);
      print(order.last.compositeFilter.topic.topicId);
      print(order.last.compositeFilter.filterMap.keys.first);
      emit(PlaceOrderRequest());
      // await locator
      //     .get<GRCPRepository>()
      //     .placeBidRequest(event.userId, event.order);
    } catch (error) {
      print(error.toString());
    }
  }

  FutureOr<void> _setValue(event, emit) async {
    emit(PlaceOrderSetValue(Order()));
  }
}
