import 'package:deedee/injection.dart';
import 'package:deedee/services/grpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(InitialState()) {
    on<TogglePremiumEvent>(_onTogglePremium);
  }

  Future<bool> _onTogglePremium(
      TogglePremiumEvent event, Emitter<AccountState> emit) async {
    try {
      return locator.get<GRCPUtils>().toggleUserPremiumStatus(event.userId);
    } catch (e) {
      return false;
    }
  }
}
