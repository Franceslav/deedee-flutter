import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/service/payment_service.pb.dart';
import 'package:deedee/repository/payment_method_repository.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:meta/meta.dart';

part 'payment_method_slider_add_method_event.dart';
part 'payment_method_slider_add_method_state.dart';

class PaymentMethodSliderBloc
    extends Bloc<PaymentMethodSliderEvent, PaymentMethodSliderState> {
  final PaymentMethodRequestRepository _paymentMethodRequestRepository;
  PaymentMethodSliderBloc(this._paymentMethodRequestRepository)
      : super(PaymentMethodSliderInitial()) {
    on<PaymentMethodSliderEvent>(_addPaymentMethod);
    _initialize();
  }

  _addPaymentMethod(PaymentMethodSliderEvent event, emit) async {
    emit(_paymentMethodRequestRepository.addPaymentMethod(
      PaymentMethodRequest(),
      CreditCardModel(
        emit.cardHolderName,
        emit.cardNumber,
        emit.cvvCode,
        emit.expiryDate,
        emit.isCvvFocused,
      ),
    ));
  }

  _initialize() async {
    final paymentMethodsList =
        await _paymentMethodRequestRepository.getAllPaymentMethods(
      PaymentMethodRequest(),
    );

    emit(PaymentMethodInitializedState(
      paymentMethodsList.map((pm) => pm.title).toList(),
    ));
  }
}
