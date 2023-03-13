part of 'place_order_bloc.dart';

abstract class PlaceOrderEvent {}

class ValidateOrderFieldsEvent extends PlaceOrderEvent {
  GlobalKey<FormState> key;

  ValidateOrderFieldsEvent(this.key);
}

class PlaceOrderRequestEvent extends PlaceOrderEvent {
  String userId;
  Order order;

  PlaceOrderRequestEvent({
    required this.userId,
    required this.order,
  });
}
