///
//  Generated code. Do not modify.
//  source: deedee/api/service/contact_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'contact_service.pb.dart' as $0;
export 'contact_service.pb.dart';

class ContactServiceClient extends $grpc.Client {
  static final _$addSocialNetworkContact =
      $grpc.ClientMethod<$0.ContactRequest, $0.ContactResponse>(
          '/deedee.api.contact.service.ContactService/addSocialNetworkContact',
          ($0.ContactRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ContactResponse.fromBuffer(value));
  static final _$editSocialNetworkContact =
      $grpc.ClientMethod<$0.ContactRequest, $0.ContactResponse>(
          '/deedee.api.contact.service.ContactService/editSocialNetworkContact',
          ($0.ContactRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ContactResponse.fromBuffer(value));
  static final _$deleteSocialNetworkContact = $grpc.ClientMethod<
          $0.ContactRequest, $0.ContactResponse>(
      '/deedee.api.contact.service.ContactService/deleteSocialNetworkContact',
      ($0.ContactRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ContactResponse.fromBuffer(value));
  static final _$getSocialNetworkContacts =
      $grpc.ClientMethod<$0.ContactRequest, $0.ContactResponse>(
          '/deedee.api.contact.service.ContactService/getSocialNetworkContacts',
          ($0.ContactRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ContactResponse.fromBuffer(value));

  ContactServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ContactResponse> addSocialNetworkContact(
      $0.ContactRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addSocialNetworkContact, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ContactResponse> editSocialNetworkContact(
      $0.ContactRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editSocialNetworkContact, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ContactResponse> deleteSocialNetworkContact(
      $0.ContactRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteSocialNetworkContact, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ContactResponse> getSocialNetworkContacts(
      $0.ContactRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSocialNetworkContacts, request,
        options: options);
  }
}

abstract class ContactServiceBase extends $grpc.Service {
  $core.String get $name => 'deedee.api.contact.service.ContactService';

  ContactServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ContactRequest, $0.ContactResponse>(
        'addSocialNetworkContact',
        addSocialNetworkContact_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContactRequest.fromBuffer(value),
        ($0.ContactResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContactRequest, $0.ContactResponse>(
        'editSocialNetworkContact',
        editSocialNetworkContact_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContactRequest.fromBuffer(value),
        ($0.ContactResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContactRequest, $0.ContactResponse>(
        'deleteSocialNetworkContact',
        deleteSocialNetworkContact_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContactRequest.fromBuffer(value),
        ($0.ContactResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContactRequest, $0.ContactResponse>(
        'getSocialNetworkContacts',
        getSocialNetworkContacts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContactRequest.fromBuffer(value),
        ($0.ContactResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ContactResponse> addSocialNetworkContact_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ContactRequest> request) async {
    return addSocialNetworkContact(call, await request);
  }

  $async.Future<$0.ContactResponse> editSocialNetworkContact_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ContactRequest> request) async {
    return editSocialNetworkContact(call, await request);
  }

  $async.Future<$0.ContactResponse> deleteSocialNetworkContact_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ContactRequest> request) async {
    return deleteSocialNetworkContact(call, await request);
  }

  $async.Future<$0.ContactResponse> getSocialNetworkContacts_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ContactRequest> request) async {
    return getSocialNetworkContacts(call, await request);
  }

  $async.Future<$0.ContactResponse> addSocialNetworkContact(
      $grpc.ServiceCall call, $0.ContactRequest request);
  $async.Future<$0.ContactResponse> editSocialNetworkContact(
      $grpc.ServiceCall call, $0.ContactRequest request);
  $async.Future<$0.ContactResponse> deleteSocialNetworkContact(
      $grpc.ServiceCall call, $0.ContactRequest request);
  $async.Future<$0.ContactResponse> getSocialNetworkContacts(
      $grpc.ServiceCall call, $0.ContactRequest request);
}
