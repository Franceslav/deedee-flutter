// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

import 'package:deedee/generated/deedee/api/model/supplier.pb.dart';
import 'package:deedee/repository/supplier_repository.dart';

part 'supplier_event.dart';
part 'supplier_state.dart';

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  final SupplierRepository _supplierRepo;
  final TopicRepository _topicRepository;

  SupplierBloc(
    this._supplierRepo,
    this._topicRepository,
  ) : super(SupplierInitialState()) {
    _initialize();
  }

  _initialize() async {
    final supplier = await _supplierRepo.getSupplier(Int64(int.parse('1')));
    final topics = await _topicRepository.getTopics(0, 0);
    emit(
      SupplierLoadState(supplier, topics),
    );
  }
}
