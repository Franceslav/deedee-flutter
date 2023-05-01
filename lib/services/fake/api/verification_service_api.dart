import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import '../../../generated/deedee/api/model/verification.pb.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class VerificationServiceApi {
  late List<Verification> _verifications;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _verifications = [
      Verification(
          verificationId: Int64(1),
          accountId: Int64(1),
          status: Verification_Status.EXPIRED,
          type: Verification_Type.EMAIL),
      Verification(
          verificationId: Int64(2),
          accountId: Int64(2),
          status: Verification_Status.EXPIRED,
          type: Verification_Type.PASSPORT),
      Verification(
          verificationId: Int64(3),
          accountId: Int64(3),
          status: Verification_Status.SENT,
          type: Verification_Type.PASSPORT),
      Verification(
          verificationId: Int64(4),
          accountId: Int64(4),
          status: Verification_Status.SENT,
          type: Verification_Type.EMAIL),
      Verification(
          verificationId: Int64(5),
          accountId: Int64(5),
          status: Verification_Status.VERIFIED,
          type: Verification_Type.PASSPORT),
      Verification(
          verificationId: Int64(6),
          accountId: Int64(6),
          status: Verification_Status.VERIFIED,
          type: Verification_Type.EMAIL),
    ];
  }

  Verification createVerification(Verification verification) {
    Verification verificationNew = Verification(
        verificationId: verification.verificationId,
         accountId: verification.accountId,
         status: verification.status,
         type: verification.type,);
    _verifications.add(verificationNew);
    return verificationNew;
  }

  List<Verification> getVerifications(Verification verification) {
    return _verifications
        .filter((element) =>
            verification.accountId == verification.accountId 
            ).toList();
  }

  Verification cancelVerification(Verification verification) {
    return _verifications
        .firstWhere((vr) => vr.verificationId == verification.verificationId);
  }

  Verification modifyVerification( Verification verification) {
    Verification verificationModify = _verifications.firstWhere(
        (vr) =>
            vr.verificationId == verification.verificationId,
            orElse: () => Verification(
            verificationId: verification.verificationId,
            accountId: verification.accountId,
            status: verification.status,
            type: verification.type));
    verificationModify.verificationId = verification.verificationId;
    verificationModify.accountId = verification.accountId;         
    verificationModify.status = verification.status;
    verificationModify.type = verification.type;
     verificationModify.type = verification.type;
    return verificationModify;
  }
}
