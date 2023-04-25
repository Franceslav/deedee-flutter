import 'package:deedee/generated/deedee/api/model/contact.pb.dart';
import 'package:deedee/generated/deedee/api/service/contact_service.pbgrpc.dart';
import 'package:deedee/injection.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod, Environment.test])
class ContactRepository {
  final ContactServiceClient _contactServiceClient =
      locator.get<ContactServiceClient>();

  Future<Contact> update(ContactRequest request, {CallOptions? options}) async {
    return (await _contactServiceClient.editSocialNetworkContact(request))
        .contacts
        .first;
  }

  Future<Contact> add(ContactRequest request, {CallOptions? options}) async {
    return (await _contactServiceClient.addSocialNetworkContact(request))
        .contacts
        .first;
  }

  Future<Contact> delete(ContactRequest request, {CallOptions? options}) async {
    return (await _contactServiceClient.deleteSocialNetworkContact(request))
        .contacts
        .first;
  }

  Future<List<Contact>> getAll(String userId, {CallOptions? options}) async {
    return (await _contactServiceClient
            .getSocialNetworkContacts(ContactRequest()))
        .contacts;
    return []; //TODO: implement
  }
}
