part of 'payment_method_slider_add_method_bloc.dart';

@immutable
abstract class PaymentMethodSliderState {}

class PaymentMethodSliderInitial extends PaymentMethodSliderState {}

class PaymentMethodInitializedState extends PaymentMethodSliderState {
  final List<String> listPaymentMethod;

  PaymentMethodInitializedState(this.listPaymentMethod);
}
