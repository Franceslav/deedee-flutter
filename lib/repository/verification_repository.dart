import 'package:deedee/injection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

import '../generated/deedee/api/model/verification.pb.dart';
import '../generated/deedee/api/service/verification_service.pbgrpc.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class VerificationRepository {
  final VerificationServiceClient _verificationServiceClient =
      locator.get<VerificationServiceClient>();

  Future<List<Verification>> getVerifications(Int64 verificationId) async {
    var response = await _verificationServiceClient.getVerifications(
      VerificationRequest(
        verification: Verification(
          verificationId: verificationId,
        ),
      ),
    );
    return response.verifications;
  }

  Future<Verification> modifyVerification(Verification currentVerification) async {
    var response =
        await _verificationServiceClient.modifyVerification( VerificationRequest(
          verification: Verification(
          verificationId: currentVerification.verificationId,
          accountId: currentVerification.accountId,
          status: currentVerification.status,
          type: currentVerification.type,
        ),
      ),
    );
    return response.verifications.firstWhere((vr) => vr.verificationId == currentVerification.verificationId);
  }

  Future<Verification> createVerification(Verification verification) async {
    var response = await _verificationServiceClient.createVerification(
      VerificationRequest(
        verification: Verification(
          verificationId: verification.verificationId,
          accountId: verification.accountId,
          status: verification.status,
          type: verification.type,
        ),
      ),
    );
    return response.verifications.first;
  }

  Future<Verification> cancelVerification(Verification verification) async {
    var response = await _verificationServiceClient.cancelVerification(
      VerificationRequest(
        verification: Verification(
          verificationId: verification.verificationId,
          accountId: verification.accountId,
          status: verification.status,
          type: verification.type,
        ),
      ),
    );
    return response.verifications.first;
  }
}

