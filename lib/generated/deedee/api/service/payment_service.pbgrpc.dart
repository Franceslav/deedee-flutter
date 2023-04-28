///
//  Generated code. Do not modify.
//  source: deedee/api/service/payment_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'payment_service.pb.dart' as $0;
export 'payment_service.pb.dart';

class PaymentServiceClient extends $grpc.Client {
  static final _$addPaymentMethod =
      $grpc.ClientMethod<$0.PaymentMethodRequest, $0.PaymentMethodResponse>(
          '/deedee.api.payment.service.PaymentService/addPaymentMethod',
          ($0.PaymentMethodRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PaymentMethodResponse.fromBuffer(value));
  static final _$editPaymentMethod =
      $grpc.ClientMethod<$0.PaymentMethodRequest, $0.PaymentMethodResponse>(
          '/deedee.api.payment.service.PaymentService/editPaymentMethod',
          ($0.PaymentMethodRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PaymentMethodResponse.fromBuffer(value));
  static final _$deletePaymentMethod =
      $grpc.ClientMethod<$0.PaymentMethodRequest, $0.PaymentMethodResponse>(
          '/deedee.api.payment.service.PaymentService/deletePaymentMethod',
          ($0.PaymentMethodRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PaymentMethodResponse.fromBuffer(value));
  static final _$getAllPaymentMethods =
      $grpc.ClientMethod<$0.PaymentMethodRequest, $0.PaymentMethodResponse>(
          '/deedee.api.payment.service.PaymentService/getAllPaymentMethods',
          ($0.PaymentMethodRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PaymentMethodResponse.fromBuffer(value));

  PaymentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.PaymentMethodResponse> addPaymentMethod(
      $0.PaymentMethodRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPaymentMethod, request, options: options);
  }

  $grpc.ResponseFuture<$0.PaymentMethodResponse> editPaymentMethod(
      $0.PaymentMethodRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editPaymentMethod, request, options: options);
  }

  $grpc.ResponseFuture<$0.PaymentMethodResponse> deletePaymentMethod(
      $0.PaymentMethodRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePaymentMethod, request, options: options);
  }

  $grpc.ResponseFuture<$0.PaymentMethodResponse> getAllPaymentMethods(
      $0.PaymentMethodRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllPaymentMethods, request, options: options);
  }
}

abstract class PaymentServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.payment.service.PaymentService';

  PaymentServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.PaymentMethodRequest, $0.PaymentMethodResponse>(
            'addPaymentMethod',
            addPaymentMethod_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.PaymentMethodRequest.fromBuffer(value),
            ($0.PaymentMethodResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.PaymentMethodRequest, $0.PaymentMethodResponse>(
            'editPaymentMethod',
            editPaymentMethod_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.PaymentMethodRequest.fromBuffer(value),
            ($0.PaymentMethodResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.PaymentMethodRequest, $0.PaymentMethodResponse>(
            'deletePaymentMethod',
            deletePaymentMethod_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.PaymentMethodRequest.fromBuffer(value),
            ($0.PaymentMethodResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.PaymentMethodRequest, $0.PaymentMethodResponse>(
            'getAllPaymentMethods',
            getAllPaymentMethods_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.PaymentMethodRequest.fromBuffer(value),
            ($0.PaymentMethodResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PaymentMethodResponse> addPaymentMethod_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.PaymentMethodRequest> request) async {
    return addPaymentMethod(call, await request);
  }

  $async.Future<$0.PaymentMethodResponse> editPaymentMethod_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.PaymentMethodRequest> request) async {
    return editPaymentMethod(call, await request);
  }

  $async.Future<$0.PaymentMethodResponse> deletePaymentMethod_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.PaymentMethodRequest> request) async {
    return deletePaymentMethod(call, await request);
  }

  $async.Future<$0.PaymentMethodResponse> getAllPaymentMethods_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.PaymentMethodRequest> request) async {
    return getAllPaymentMethods(call, await request);
  }

  $async.Future<$0.PaymentMethodResponse> addPaymentMethod(
      $grpc.ServiceCall call, $0.PaymentMethodRequest request);
  $async.Future<$0.PaymentMethodResponse> editPaymentMethod(
      $grpc.ServiceCall call, $0.PaymentMethodRequest request);
  $async.Future<$0.PaymentMethodResponse> deletePaymentMethod(
      $grpc.ServiceCall call, $0.PaymentMethodRequest request);
  $async.Future<$0.PaymentMethodResponse> getAllPaymentMethods(
      $grpc.ServiceCall call, $0.PaymentMethodRequest request);
}
