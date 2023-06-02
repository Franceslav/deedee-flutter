import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'business_event.dart';

part 'business_state.dart';

class BusinessPageBloc extends Bloc<BusinessEvent, BusinessState> {
  bool policyAccepted = false;
  bool buttonConnectBusiness = false;

  BusinessPageBloc() : super(BusinessStateInitialState()) {
    on<PolicyCheckedEvent>(_policyAccepted);
    on<ButtonConnectEvent>(_buttonConnectBusiness);
    on<ChangeFormEvent>(_formValue);
  }

  _policyAccepted(PolicyCheckedEvent event, emit) {
    final policyAccepted = event.policyAccepted;
    emit(BusinessPageState(policyAccepted, buttonConnectBusiness));
  }

  _buttonConnectBusiness(ButtonConnectEvent event, emit) {
    final buttonConnectBusiness = event.buttonConnectBusiness;
    if (policyAccepted) {
      emit(
        BusinessConnectTapState(buttonConnectBusiness),
      );
    } else {
      emit(
        BusinessConnectTapState(!buttonConnectBusiness),
      );
    }
  }

  _formValue(ChangeFormEvent event, emit) {
    {
      if (event.formValue.isEmpty) {
        emit(BusinessPageState(false, false));
      }
    }
  }
}