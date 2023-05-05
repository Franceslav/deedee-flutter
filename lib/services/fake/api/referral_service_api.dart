import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/referral.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:protobuf/protobuf.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ReferralServiceApi {
  final _refs = () {
    final refs = [
      Referral()
        ..referralId = Int64(1)
        ..email = "referral1@email.ru"
        ..referredBy = "user@email.ru",
      Referral()
        ..referralId = Int64(2)
        ..email = "referral2@email.ru"
        ..referredBy = "user@email.ru",
      Referral()
        ..referralId = Int64(3)
        ..email = "referral3@email.ru"
        ..referredBy = "user@email.ru",
    ];
    return {for (final ref in refs) ref.referralId: ref};
  }();

  Int64 get _maxId => _refs.keys.max() ?? Int64(1);

  List<Referral> getReferral(Referral filter) {
    final ids = _filterReferrals(filter);
    return [for (final id in ids) _refs[id]!.deepCopy()];
  }

  List<Referral> insertReferral(Referral ref) {
    if (ref.hasReferralId() && _refs.containsKey(ref.referralId)) {
      return [];
    }
    final newId = ref.hasReferralId() ? ref.referralId : _maxId + 1;
    final newRef = ref.deepCopy()..referralId = newId;
    _refs[newId] = newRef;
    return [newRef.deepCopy()];
  }

  List<Referral> deleteReferral(Referral filter) {
    final filtered = _filterReferrals(filter);
    final deleted = <Referral>[];
    for (final id in filtered) {
      final removed = _refs.remove(id);
      if (removed != null) deleted.add(removed);
    }
    return deleted;
  }

  List<Referral> updateReferral(Referral ref) {
    final updated = _refs.update(
      ref.referralId,
      (_) => ref,
      ifAbsent: () => ref,
    );
    return [updated.deepCopy()];
  }

  List<Int64> _filterReferrals(Referral filter) {
    final tags = filter.info_.fieldInfo.values.map((e) => e.tagNumber);
    var filtered = _refs.filterValues(((ref) {
      for (final tag in tags) {
        if (!filter.hasField(tag)) continue;
        if (!ref.hasField(tag)) return false;
        if (filter.getField(tag) != ref.getField(tag)) return false;
      }
      return true;
    }));
    return filtered.keys.toList();
  }
}
