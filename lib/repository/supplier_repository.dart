import 'package:deedee/generated/deedee/api/model/supplier.pb.dart';
import 'package:deedee/generated/deedee/api/service/supplier_service.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

import '../injection.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class SupplierRepository {
  final SupplierServiceClient _supplierServiceClient =
      locator.get<SupplierServiceClient>();

  Future<Supplier> getSupplier(Int64 supplierId) async {
    final response = await _supplierServiceClient.getSupplierEntities(
        SupplierRequest(supplier: Supplier(supplierId: supplierId)));
    return response.suppliers.first;
    // return response.suppliers
    //     .firstWhere((element) => element.supplierId == supplierId);
  }

  Future<Supplier> createSupplier(Int64 supplierId) async {
    final response = await _supplierServiceClient
        .createSupplierEntity(SupplierRequest(supplier: Supplier()));
    return response.suppliers.first;
  }
}
