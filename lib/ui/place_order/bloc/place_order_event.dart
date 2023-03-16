part of 'place_order_bloc.dart';

abstract class PlaceOrderEvent {}

class PlaceOrderSetValueEvent extends PlaceOrderEvent {}

class PlaceOrderRequestEvent extends PlaceOrderEvent {
  String userId;
  Order order;

  PlaceOrderRequestEvent({
    required this.userId,
    required this.order,
  });
}
