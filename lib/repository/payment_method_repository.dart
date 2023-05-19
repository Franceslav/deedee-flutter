import 'package:deedee/generated/deedee/api/model/payment_method.pb.dart';
import 'package:deedee/generated/deedee/api/service/payment_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class PaymentMethodRequestRepository {
  final _requestServiceClient = locator.get<PaymentServiceClient>();

  PaymentMethodRequest _getPaymentMethodRequest(
    PaymentMethodRequest request,
  ) {
    return PaymentMethodRequest(
      paymentMethod: PaymentMethod(
        addedBy: request.paymentMethod.addedBy,
        createdAt: request.paymentMethod.createdAt,
        geolocation: request.paymentMethod.geolocation,
        paymentMethodId: request.paymentMethod.paymentMethodId,
        status: request.paymentMethod.status,
        title: request.paymentMethod.title,
        type: request.paymentMethod.type,
      ),
    );
  }

  Future<PaymentMethodResponse> addPaymentMethod(
    PaymentMethodRequest request,
    CreditCardModel cardModel, {
    CallOptions? options,
  }) async {
    final response = await _requestServiceClient.addPaymentMethod(
      _getPaymentMethodRequest(request),
      options: options,
    );
    return response;
  }

  Future<PaymentMethod> editPaymentMethod(
    PaymentMethodRequest request, {
    CallOptions? options,
  }) async {
    final response = await _requestServiceClient.editPaymentMethod(
      _getPaymentMethodRequest(request),
      options: options,
    );
    return response.paymentMethods
        .firstWhere((element) => element == request.paymentMethod);
  }

  Future<PaymentMethod> deletePaymentMethod(
    PaymentMethodRequest request, {
    CallOptions? options,
  }) async {
    var response = await _requestServiceClient.deletePaymentMethod(
      _getPaymentMethodRequest(request),
      options: options,
    );
    return response.paymentMethods
        .firstWhere((element) => element == request.paymentMethod);
  }

  Future<PaymentMethod> getPaymentMethod(
    PaymentMethodRequest request, {
    CallOptions? options,
  }) async {
    var response = await _requestServiceClient.getAllPaymentMethods(
      _getPaymentMethodRequest(request),
      options: options,
    );
    return response.paymentMethods
        .firstWhere((element) => element == request.paymentMethod);
  }

  Future<List<PaymentMethod>> getAllPaymentMethods(
    PaymentMethodRequest request, {
    CallOptions? options,
  }) async {
    var response = await _requestServiceClient.getAllPaymentMethods(
      _getPaymentMethodRequest(request),
      options: options,
    );
    List<PaymentMethod> listPaymentMethod = response.paymentMethods;
    return listPaymentMethod;
  }
}
