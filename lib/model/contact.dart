enum ContactType {
  email,
  phone,
  instagram,
  telegram,
}

class Contact {
  final ContactType type;
  final String value;
  final String description;

  Contact(
    this.type,
    this.value,
    this.description,
  );
}
