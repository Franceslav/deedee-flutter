import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/referral.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/repository/referral_repository.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

part 'referral_state.dart';

class ReferralCubit extends Cubit<ReferralState> {
  final refsRepo = locator.get<ReferralRepository>();

  ReferralCubit(User user) : super(ReferralStateInitial(user: user)) {
    _fetchRefs();
  }

  void addReferral(Referral ref) async {
    emit(state.copyWith(ReferralStateLoading.new));
    await refsRepo.addReferral(ref);
    _fetchRefs();
  }

  void removeReferral(Int64 id) async {
    emit(state.copyWith(ReferralStateLoading.new));
    await refsRepo.removeReferralById(id);
    _fetchRefs();
  }

  void _fetchRefs() async {
    emit(state.copyWith(ReferralStateLoading.new, refs: []));
    final refs = await refsRepo.getReferralsOfUser(state.user.email);
    emit(state.copyWith(ReferralStateMain.new, refs: refs));
  }
}
