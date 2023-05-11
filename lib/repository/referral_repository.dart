import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/referral.pb.dart';
import 'package:deedee/generated/deedee/api/service/referral_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ReferralRepository {
  final ReferralServiceClient _client = locator.get<ReferralServiceClient>();

  Future<Referral?> addReferral(Referral referral) async {
    final response = await _client.addReferral(
      ReferralRequest(referral: referral),
    );
    return response.referrals.firstOrNull;
  }

  Future<Referral?> editReferral(Referral referral) async {
    final response = await _client.editReferral(
      ReferralRequest(referral: referral),
    );
    return response.referrals.first;
  }

  Future<List<Referral>> getReferralsOfUser(String email) async {
    final response = await _client.getReferrals(
      ReferralRequest(referral: Referral(referredBy: email)),
    );
    return response.referrals;
  }

  Future<Referral?> getReferralById(Int64 id) async {
    final response = await _client.getReferrals(
      ReferralRequest(referral: Referral(referralId: id)),
    );
    return response.referrals.firstOrNull;
  }

  Future<Referral?> removeReferralById(Int64 id) async {
    final response = await _client.removeReferral(
      ReferralRequest(referral: Referral(referralId: id)),
    );
    return response.referrals.firstOrNull;
  }

  Future<List<Referral>> removeReferralsOfUser(String email) async {
    final response = await _client.removeReferral(
      ReferralRequest(referral: Referral(referredBy: email)),
    );
    return response.referrals;
  }
}
