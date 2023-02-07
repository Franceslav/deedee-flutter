import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user.dart';
import '../../../services/grpc.dart';
import '../../../services/locator.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(InitialState()) {
    on<TogglePremiumEvent>(_onTogglePremium);
  }

  Future<bool> _onTogglePremium(
      TogglePremiumEvent event, Emitter<AccountState> emit) async {
    try {
      return serviceLocator
          .get<GRCPUtils>()
          .toggleUserPremiumStatus(event.userId);
    } catch (e) {
      return false;
    }
  }
}
