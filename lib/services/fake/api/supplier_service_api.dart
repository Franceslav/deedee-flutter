import 'dart:math';

import 'package:deedee/generated/deedee/api/model/geolocation.pb.dart';
import 'package:deedee/generated/deedee/api/model/supplier.pb.dart';
import 'package:deedee/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class SupplierServiceApi {
  late List<Supplier> _suppliers;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _suppliers = [
      Supplier()
        ..supplierId = Int64(1)
        ..createdBy = 'ron.x.by.su@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..status = Supplier_Status.ACTIVE,
      Supplier()
        ..supplierId = Int64(2)
        ..createdBy = 'ron.x.by.su@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..status = Supplier_Status.ACTIVE,
      Supplier()
        ..supplierId = Int64(3)
        ..createdBy = 'ron.x.by.su@gmail.com'
        ..createdAt = Timestamp(
            seconds: Int64.parseInt(
                (DateTime.now().millisecondsSinceEpoch / 1000 + 1000000)
                    .round()
                    .toString()))
        ..geolocation = Geolocation(latitude: 51.51, longitude: -0.1165888)
        ..status = Supplier_Status.SUSPENDED
    ];
  }

  Future<Supplier> getSupplier(Int64 supplierId) async {
    return _suppliers.firstWhere((s) => s.createdBy == supplierId);
  }

  Future<Supplier> createSupplier(Supplier supplier) async {
    int rng = Random().nextInt(1000);
    return _suppliers.firstWhere(
      (s) => s.createdBy == supplier.createdBy,
      orElse: () => Supplier(
        supplierId: Int64(rng),
        createdAt:
            Timestamp(seconds: Int64.parseInt((DateTime.now().toString()))),
        geolocation: Geolocation(latitude: 53.51, longitude: -0.1165888),
        status: Supplier_Status.ACTIVE,
      ),
    );
  }
}
