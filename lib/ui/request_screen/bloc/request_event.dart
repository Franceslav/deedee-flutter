part of 'request_bloc.dart';

@immutable
abstract class ServicePushRequestEvent {}

class ServiceRequestPriceChangeEvent extends ServicePushRequestEvent {
   final String price;
  ServiceRequestPriceChangeEvent({required this.price});
}

class ServiceRequestDateChangeEvent extends ServicePushRequestEvent {
  final String date;
  ServiceRequestDateChangeEvent({required this.date});
}


class ServiceRequestTimeChangeEvent extends ServicePushRequestEvent {
  final String time;
  ServiceRequestTimeChangeEvent({required this.time});
}
