import 'package:bloc/bloc.dart';
import 'package:deedee/model/order.dart';
import 'package:flutter/material.dart';
import '../../../injection.dart';
import '../../../services/grpc.dart';

part 'place_order_event.dart';
part 'place_order_state.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  PlaceOrderBloc() : super(PlaceBidInitial()) {
    on<ValidateOrderFieldsEvent>((event, emit) async {
      if (event.key.currentState?.validate() ?? false) {
        event.key.currentState!.save();
        emit(PlaceOrderValid());
      } else {
        emit(PlaceOrderFailureState(
            errorMessage: 'Please fill required fields.'));
      }
    });
    on<PlaceOrderRequestEvent>((event, emit) async {
      try {
        emit(PlaceOrderRequest());
        await locator.get<GRCPRepository>().placeBidRequest(event.userId,event.order);
      } catch (error) {
        print(error.toString());
      }
    });
  }
}
