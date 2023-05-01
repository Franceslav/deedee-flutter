import 'package:dartx/dartx.dart';
import 'package:deedee/generated/deedee/api/model/contact.pb.dart';
import 'package:deedee/generated/deedee/api/service/contact_service.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.test])
class ContactServiceApi {
  late List<Contact> _contacts;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _contacts = [
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
      ];
  }

  // void create(
  //     String userId,
  //     Int64 contactId, 
  //     String contactUserID,
  //     Contact_Type type,
  //     [Contact_Status status = Contact_Status.ADDED,
  //     String value = '']) {
        
  //       _contacts[userId]?.add(
  //         Contact(
  //           contactId: contactId,
  //           userId: contactUserID,
  //           status: status,
  //           type: type,
  //           value: value,
  //         )
  //       );
  // }


Contact create(Contact contact) {
    Contact c = Contact(
          contactId: contact.contactId,
          userId: contact.userId,
          status: contact.status,
          type: contact.type,
          value: contact.value,
        );
    
    _contacts.add(c);

    return c;
}









  
  List<Contact> getContacts(Contact contact) {
    return _contacts
        .filter((c) => c.status != Contact_Status.DELETED)
        .toList();
  }



  Contact update(Contact contact) {
    Contact c =_contacts
        .firstWhere((c) => c.contactId == contact.contactId && c.status != Contact_Status.DELETED, 
                    orElse: () => Contact(
                      contactId: contact.contactId, 
                      userId: contact.userId, 
                      status: contact.status,
                      type: contact.type,
                      value: contact.value,
                      ));


      c.status = contact.status;
      c.type = contact.type;
      c.value = contact.value;

      return c;


  }

 
  Contact delete(Contact contact) {
    return _contacts
        .firstWhere((c) => c.contactId == contact.contactId)
      ..status = Contact_Status.DELETED;
  }

}

  
