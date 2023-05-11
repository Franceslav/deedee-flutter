part of 'supplier_bloc.dart';

@immutable
abstract class SupplierState {}

class SupplierInitialState extends SupplierState {}

class SupplierLoadState extends SupplierState {
  final Supplier suplier;
  final List<Topic> topic;

  SupplierLoadState(this.suplier, this.topic);
}
