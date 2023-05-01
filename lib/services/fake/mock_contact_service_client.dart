import 'package:deedee/generated/deedee/api/model/contact.pb.dart';
import 'package:deedee/generated/deedee/api/service/contact_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/services/fake/api/contact_service_api.dart';
import 'package:deedee/services/fake/fake_client.dart';
import 'package:fixnum/fixnum.dart';
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
    return ResponseFuture(
      FakeClientCall<dynamic, ContactResponse>(
        _addSocialNetworkContact(request),
      ),
    );
  }

  Future<ContactResponse> _addSocialNetworkContact(ContactRequest request) async {
    return ContactResponse(
      contacts: [
        api.create(
          Contact(
            contactId: Int64(DateTime.now().microsecondsSinceEpoch),
            userId: request.contact.userId,
            status: request.contact.status,
            type: request.contact.type,
            value: request.contact.value,
          )),

      ]
    );
  }



  @override
  ResponseFuture<ContactResponse> getSocialNetworkContacts(
      ContactRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ContactResponse>(
        _getSocialNetworkContacts(request),
      ),
    );
  }

  Future<ContactResponse> _getSocialNetworkContacts(
      ContactRequest request) async {
    var contacts = api.getContacts(
      Contact(contactId: request.contact.contactId),
    );
    //TODO: check if stream is working
/*    var contactStream = Stream.fromIterable(contacts);
    contactStream.listen((value) {
      contact = value;
    });*/
    return ContactResponse()..contacts.addAll(contacts);
  }



  @override
  ResponseFuture<ContactResponse> deleteSocialNetworkContact(
      ContactRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ContactResponse>(
        _deleteSocialNetworkContact(request),
      ),
    );
  }


  Future<ContactResponse> _deleteSocialNetworkContact(ContactRequest request) async {
    return ContactResponse(
      contacts: [
        api.delete(
          Contact(
            contactId: request.contact.contactId,
          )),

      ]
    );
  }





  @override
  ResponseFuture<ContactResponse> editSocialNetworkContact(
      ContactRequest request,
      {CallOptions? options}) {
    return ResponseFuture(
      FakeClientCall<dynamic, ContactResponse>(
        _editSocialNetworkContact(request),
      ),
    );
  }

  
  Future<ContactResponse> _editSocialNetworkContact (ContactRequest request) async {
    
      return ContactResponse(
        contacts: [
          api.update(
            Contact(
              contactId: request.contact.contactId,
            )),

        ]
      );

  }






}
