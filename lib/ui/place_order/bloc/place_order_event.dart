// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'place_order_bloc.dart';

abstract class PlaceOrderEvent {}

class PlaceOrderSetValueEvent extends PlaceOrderEvent {}

class PlaceOrderRequestEvent extends PlaceOrderEvent {
  String userId;
  Order order;
  final LatLng location;
  final String topic;
  final Map<String, FilterKeyList> filterMap;
  final int topicId;

  PlaceOrderRequestEvent({
    required this.userId,
    required this.order,
    required this.location,
    required this.topic,
    required this.filterMap,
    required this.topicId,
  });
}
