import 'package:deedee/generated/contact_service.pbgrpc.dart';
import 'package:deedee/generated/request_service_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ContactRepository {
  final ContactServiceClient _contactServiceClient =
      locator.get<ContactServiceClient>();

  Future<Contact> update(ContactRequest request,
      {CallOptions? options}) async {
    return (await _contactServiceClient.editSocialNetworkContact(request)).contact;
  }

  Future<Contact> add(ContactRequest request,
      {CallOptions? options}) async {
    return (await _contactServiceClient.addSocialNetworkContact(request)).contact;
  }

  Future<Contact> delete(ContactRequest request,
      {CallOptions? options}) async {
    return (await _contactServiceClient.deleteSocialNetworkContact(request)).contact;
  }

  Future<List<Contact>> getAll(String userId,
      {CallOptions? options}) async {
    var response = _contactServiceClient
        .getSocialNetworkContacts(ContactRequest()..contact = Contact(userId: userId));
    return []; //TODO: implement
  }
}
