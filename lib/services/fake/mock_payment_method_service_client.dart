import 'package:deedee/generated/deedee/api/model/payment_method.pb.dart';
import 'package:deedee/generated/deedee/api/model/payment_method.pbenum.dart';
import 'package:deedee/generated/deedee/api/service/payment_service.pbgrpc.dart';
import 'package:deedee/generated/deedee/api/service/service_request_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/payment_method_service_api.dart';
import 'package:deedee/services/fake/api/service_request_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PaymentServiceClient, env: [Environment.dev])
class MockPaymentMethodServiceClient implements PaymentServiceClient {
  PaymentMethodServiceApi api = locator.get<PaymentMethodServiceApi>();

  // ??
  @override
  ClientCall<Q, R> $createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  // ??
  @override
  ResponseStream<R> $createStreamingCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  // ??
  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request,
      {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<PaymentMethodResponse> addPaymentMethod(
    PaymentMethodRequest request, {
    CallOptions? options,
  }) {
    return ResponseFuture(FakeClientCall<dynamic, PaymentMethodResponse>(
        _addPaymentMethod(request)));
    //throw UnimplementedError();
  }

  Future<PaymentMethodResponse> _addPaymentMethod(
      PaymentMethodRequest request) async {
    return PaymentMethodResponse(
      paymentMethods: [
        api.add(
          '', // because payment_method_service_api.dart doesn't have any other UserIDs
          request.paymentMethod,
        )
      ],
    );
  }

  @override
  ResponseFuture<PaymentMethodResponse> deletePaymentMethod(
    PaymentMethodRequest request, {
    CallOptions? options,
  }) {
    return ResponseFuture(FakeClientCall<dynamic, PaymentMethodResponse>(
        _deletePaymentMethod(request)));
  }

  Future<PaymentMethodResponse> _deletePaymentMethod(
      PaymentMethodRequest request) async {
    return PaymentMethodResponse(
      paymentMethods: [
        api.delete(
          '', // because payment_method_service_api.dart doesn't have any other UserIDs
          request.paymentMethod.paymentMethodId,
        )
      ],
    );
  }

  @override
  ResponseFuture<PaymentMethodResponse> editPaymentMethod(
    PaymentMethodRequest request, {
    CallOptions? options,
  }) {
    return ResponseFuture(FakeClientCall<dynamic, PaymentMethodResponse>(
        _editPaymentMethod(request)));
  }

  Future<PaymentMethodResponse> _editPaymentMethod(
      PaymentMethodRequest request) async {
    return PaymentMethodResponse(
      paymentMethods: [
        api.edit(
          '', // Because payment_method_service_api.dart doesn't have any other UserIDs
          request.paymentMethod.paymentMethodId,
          title:
              'An example of changing title (<mock_payment_method_service_client.dart>).',
          // The type was not specified specifically (for testing)
          // EXAMPLE: 'type: PaymentMethod_Type.CARD,'
        )
      ],
    );
  }

  @override
  ResponseFuture<PaymentMethodResponse> getAllPaymentMethods(
    PaymentMethodRequest request, {
    CallOptions? options,
  }) {
    return ResponseFuture(FakeClientCall<dynamic, PaymentMethodResponse>(
        _getAllPaymentMethod(request)));
  }

  Future<PaymentMethodResponse> _getAllPaymentMethod(
      PaymentMethodRequest request) async {
    return PaymentMethodResponse(
      // Because payment_method_service_api.dart doesn't have any other UserIDs
      paymentMethods: api.get(''),
    );
  }
}
