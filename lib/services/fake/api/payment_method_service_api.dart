import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/payment_method.pb.dart';
import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/generated/deedee/api/service/payment_service.pbgrpc.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class PaymentMethodServiceApi {
  late Map<String, List<PaymentMethod>> _serviceRequests;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    var timestamp1 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    var timestamp2 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    var timestamp3 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    var timestamp4 = Timestamp()
      ..seconds = Int64.parseInt(
          (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
    _serviceRequests = {
      '': [
        PaymentMethod(
          addedBy: Int64(0),
          createdAt: timestamp1,
          geolocation: Geolocation(latitude: 51.51, longitude: -0.1165888),
          paymentMethodId: Int64(1),
          status: PaymentMethod_Status.ADDED,
          title: 'Visa',
          type: PaymentMethod_Type.CARD,
        ),
        PaymentMethod(
          addedBy: Int64(0),
          createdAt: timestamp2,
          geolocation: Geolocation(latitude: 51.51, longitude: -0.1165888),
          paymentMethodId: Int64(1),
          status: PaymentMethod_Status.CHANGED,
          title: 'MasterCard',
          type: PaymentMethod_Type.CARD,
        ),
        PaymentMethod(
          addedBy: Int64(1),
          createdAt: timestamp3,
          geolocation: Geolocation(latitude: 51.521, longitude: -0.116),
          paymentMethodId: Int64(2),
          status: PaymentMethod_Status.ADDED,
          title: 'MIR',
          type: PaymentMethod_Type.CARD,
        ),
        PaymentMethod(
          addedBy: Int64(1),
          createdAt: timestamp4,
          geolocation: Geolocation(latitude: 51.521, longitude: -0.116),
          paymentMethodId: Int64(2),
          status: PaymentMethod_Status.DELETED,
          title: 'Transfer',
          type: PaymentMethod_Type.BANK_TRANSFER,
        ),
      ]
    };
  }

  PaymentMethod add(
    String userID,
    PaymentMethod element,
  ) {
    _serviceRequests[userID]!.add(element);
    return element;
  }

  List<PaymentMethod> get(String userId) {
    return _serviceRequests.getOrElse(userId, () => []);
  }

  PaymentMethod edit(
    String userID,
    Int64 paymentMethodId, {
    PaymentMethod_Type? type,
    String? title,
  }) {
    // if only the title was changed
    if (type == null) {
      if (title != null) {
        return _serviceRequests
            .getOrElse(userID, () => [])
            .firstWhere((value) => value.paymentMethodId == paymentMethodId)
          ..status = PaymentMethod_Status.CHANGED
          ..title = title;
      }
    }
    // if only the type was changed
    else if (title == null) {
      return _serviceRequests
          .getOrElse(userID, () => [])
          .firstWhere((value) => value.paymentMethodId == paymentMethodId)
        ..status = PaymentMethod_Status.CHANGED
        ..type = type;
    }
    // if nothing has changed
    throw Exception(
        'Both fields in the \'api.edit()\' method were <null>, so nothing has changed!');
  }

  PaymentMethod delete(
    String userID,
    Int64 paymentMethodId,
  ) {
    return _serviceRequests
        .getOrElse(userID, () => [])
        .firstWhere((value) => value.paymentMethodId == paymentMethodId)
      ..status = PaymentMethod_Status.DELETED;
  }
}
