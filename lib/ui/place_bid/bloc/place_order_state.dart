part of 'place_order_bloc.dart';

abstract class PlaceOrderState {}

class PlaceBidInitial extends PlaceOrderState {}

class PlaceOrderValid extends PlaceOrderState {}

class PlaceOrderRequest extends PlaceOrderState {}

class PlaceOrderFailureState extends PlaceOrderState {
  String errorMessage;

  PlaceOrderFailureState({required this.errorMessage});
}
