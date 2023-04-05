import 'package:deedee/generated/contact_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/contact_repository.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/common.dart';
import 'package:grpc/src/client/method.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ContactServiceClient, env: [Environment.dev])
class MockContactServiceClient implements ContactServiceClient {
  ContactServiceApi api = locator.get<ContactServiceApi>();

  @override
  ClientCall<Q, R> $createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createCall
    throw UnimplementedError();
  }

  @override
  ResponseStream<R> $createStreamingCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests,
      {CallOptions? options}) {
    // TODO: implement $createStreamingCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<R> $createUnaryCall<Q, R>(ClientMethod<Q, R> method, Q request,
      {CallOptions? options}) {
    // TODO: implement $createUnaryCall
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ContactResponse> addSocialNetworkContact(
      ContactRequest request,
      {CallOptions? options}) {
    // TODO: implement addSocialNetworkContact
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ContactResponse> deleteSocialNetworkContact(
      ContactRequest request,
      {CallOptions? options}) {
    // TODO: implement deleteSocialNetworkContact
    throw UnimplementedError();
  }

  @override
  ResponseFuture<ContactResponse> editSocialNetworkContact(
      ContactRequest request,
      {CallOptions? options}) {
    // TODO: implement editSocialNetworkContact
    throw UnimplementedError();
  }

  @override
  ResponseStream<ContactResponse> getSocialNetworkContacts(
      ContactRequest request,
      {CallOptions? options}) {
    return ResponseStream(FakeClientCall<dynamic, ContactResponse>(
        _getSocialNetworkContacts(request)));
  }

  Future<ContactResponse> _getSocialNetworkContacts(
      ContactRequest request) async {
    return ContactResponse()
      ..contact =
          api.getContacts(request.contact.userId)[0]; //TODO: make stream
  }
}
