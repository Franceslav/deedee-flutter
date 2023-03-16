part of 'place_order_bloc.dart';

abstract class PlaceOrderState {}

class PlaceBidInitial extends PlaceOrderState {}

class PlaceOrderSetValue extends PlaceOrderState {
  final Order order;

  PlaceOrderSetValue(this.order);
}

class PlaceOrderRequest extends PlaceOrderState {}

class PlaceOrderFailureState extends PlaceOrderState {
  String errorMessage;

  PlaceOrderFailureState({required this.errorMessage});
}
