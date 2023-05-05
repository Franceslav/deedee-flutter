import 'package:deedee/generated/deedee/api/model/referral.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/referral_repository.dart';
import 'package:fixnum/fixnum.dart';
import 'package:test/test.dart';

void main() async {
  configureDependencies('test');
  await Future.delayed(const Duration(seconds: 1));

  final repo = ReferralRepository();
  group('add', () {
    test('', () async {
      final ref = Referral(referralId: Int64(4));
      await repo.removeReferralById(ref.referralId);
      final newRef = await repo.addReferral(ref);
      expect(newRef, ref);
    });
    test('', () async {
      final ref = Referral(referralId: Int64(1));
      final sameRef = Referral(referralId: Int64(1));
      await repo.addReferral(ref);
      final newRef = await repo.addReferral(sameRef);
      expect(newRef, null);
    });
    test('', () async {
      final ref = Referral();
      final newRef = await repo.addReferral(ref);
      expect(!ref.hasReferralId(), newRef!.hasReferralId());
    });
  });
  group('get', () {
    setUp(() => repo.addReferral(Referral(
          referralId: Int64.ONE,
          referredBy: 'test@email',
        )));
    test('', () async {
      var ref = await repo.getReferralById(Int64(1));
      expect(ref, isNotNull);
    });
    test('', () async {
      repo.removeReferralById(Int64(1));
      final ref = await repo.getReferralById(Int64(1));
      expect(ref, isNull);
    });
    test('', () async {
      final refs = await repo.getReferralsOfUser('test@email');
      expect(refs.length, 1);
    });
  });
  group('edit', () {
    setUp(() => repo.addReferral(Referral(referralId: Int64.ONE)));
    test('if exist, update', () async {
      final ref = Referral(referralId: Int64.ONE, referredBy: 'test@email');
      final edited = await repo.editReferral(ref);
      expect(edited, ref);
    });
    test('if not exist, add new', () async {
      final ref = Referral(referralId: Int64.ONE, referredBy: 'test@email');
      await repo.removeReferralById(Int64.ONE);
      final edited = await repo.editReferral(ref);
      expect(edited, ref);
    });
  });
  group('remove', () {
    test('', () async {
      await repo.removeReferralsOfUser('test@email');
      final refs = await repo.getReferralsOfUser('test@email');
      expect(refs.length, 0);
    });
    test('', () async {
      await repo.addReferral(Referral(referralId: Int64(1)));
      final deleted = await repo.removeReferralById(Int64(1));
      expect(deleted, isNotNull);
    });
    test('', () async {
      final deleted = await repo.removeReferralById(Int64(10));
      expect(deleted, isNull);
    });
  });
}
