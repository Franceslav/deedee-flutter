import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/contact.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ContactServiceApi {
  late Map<String, List<Contact>> _contacts;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _contacts = {
      "": [
        Contact(
          contactId: Int64(1),
          userId: '',
          status: Contact_Status.ADDED,
          type: Contact_Type.EMAIL,
          value: 'test@test.com',
        ),
        Contact(
          contactId: Int64(2),
          userId: '',
          status: Contact_Status.ADDED,
          type: Contact_Type.PHONE,
          value: '44927543956',
        ),
        Contact(
          contactId: Int64(3),
          userId: '',
          status: Contact_Status.ADDED,
          type: Contact_Type.INSTAGRAM,
          value: 'selenagomez',
        ),
        Contact(
          contactId: Int64(4),
          userId: '',
          status: Contact_Status.ADDED,
          type: Contact_Type.VK,
          value: '',
        ),
      ]
    };
  }

  List<Contact> getContacts(String userId) {
    return _contacts
        .getOrElse(userId, () => [])
        .filter((c) => c.status != Contact_Status.DELETED)
        .toList();
  }

  Contact delete(userId, contactId) {
    return _contacts
        .getOrElse(userId, () => [])
        .firstWhere((c) => c.contactId == contactId)
      ..status = Contact_Status.DELETED;
  }
}
