///
//  Generated code. Do not modify.
//  source: deedee/api/service/payment_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model/payment_method.pb.dart' as $1;

class PaymentMethodRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PaymentMethodRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'deedee.api.payment.service'),
      createEmptyInstance: create)
    ..aOM<$1.PaymentMethod>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paymentMethod',
        protoName: 'paymentMethod',
        subBuilder: $1.PaymentMethod.create)
    ..hasRequiredFields = false;

  PaymentMethodRequest._() : super();
  factory PaymentMethodRequest({
    $1.PaymentMethod? paymentMethod,
  }) {
    final _result = create();
    if (paymentMethod != null) {
      _result.paymentMethod = paymentMethod;
    }
    return _result;
  }
  factory PaymentMethodRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PaymentMethodRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PaymentMethodRequest clone() =>
      PaymentMethodRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PaymentMethodRequest copyWith(void Function(PaymentMethodRequest) updates) =>
      super.copyWith((message) => updates(message as PaymentMethodRequest))
          as PaymentMethodRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaymentMethodRequest create() => PaymentMethodRequest._();
  PaymentMethodRequest createEmptyInstance() => create();
  static $pb.PbList<PaymentMethodRequest> createRepeated() =>
      $pb.PbList<PaymentMethodRequest>();
  @$core.pragma('dart2js:noInline')
  static PaymentMethodRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaymentMethodRequest>(create);
  static PaymentMethodRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.PaymentMethod get paymentMethod => $_getN(0);
  @$pb.TagNumber(1)
  set paymentMethod($1.PaymentMethod v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPaymentMethod() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentMethod() => clearField(1);
  @$pb.TagNumber(1)
  $1.PaymentMethod ensurePaymentMethod() => $_ensure(0);
}

class PaymentMethodResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PaymentMethodResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'deedee.api.payment.service'),
      createEmptyInstance: create)
    ..pc<$1.PaymentMethod>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paymentMethods',
        $pb.PbFieldType.PM,
        protoName: 'paymentMethods',
        subBuilder: $1.PaymentMethod.create)
    ..hasRequiredFields = false;

  PaymentMethodResponse._() : super();
  factory PaymentMethodResponse({
    $core.Iterable<$1.PaymentMethod>? paymentMethods,
  }) {
    final _result = create();
    if (paymentMethods != null) {
      _result.paymentMethods.addAll(paymentMethods);
    }
    return _result;
  }
  factory PaymentMethodResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PaymentMethodResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PaymentMethodResponse clone() =>
      PaymentMethodResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PaymentMethodResponse copyWith(
          void Function(PaymentMethodResponse) updates) =>
      super.copyWith((message) => updates(message as PaymentMethodResponse))
          as PaymentMethodResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaymentMethodResponse create() => PaymentMethodResponse._();
  PaymentMethodResponse createEmptyInstance() => create();
  static $pb.PbList<PaymentMethodResponse> createRepeated() =>
      $pb.PbList<PaymentMethodResponse>();
  @$core.pragma('dart2js:noInline')
  static PaymentMethodResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaymentMethodResponse>(create);
  static PaymentMethodResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.PaymentMethod> get paymentMethods => $_getList(0);
}
