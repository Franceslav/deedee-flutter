part of 'referral_cubit.dart';

typedef ReferralStateBuilder<T> = T Function({
  required User user,
  required List<Referral> refs,
});

@immutable
abstract class ReferralState {
  final User user;
  final List<Referral> refs;

  ReferralState({
    required this.user,
    List<Referral>? refs,
  }) : refs = refs ?? [];

  T copyWith<T extends ReferralState>(
    ReferralStateBuilder<T> builder, {
    User? user,
    List<Referral>? refs,
  }) {
    return builder(
      user: user ?? this.user,
      refs: refs ?? this.refs,
    );
  }
}

class ReferralStateInitial extends ReferralState {
  ReferralStateInitial({required super.user});
}

class ReferralStateLoading extends ReferralState {
  ReferralStateLoading({
    required super.user,
    super.refs,
  });
}

class ReferralStateMain extends ReferralState {
  ReferralStateMain({
    required super.user,
    super.refs,
  });
}
