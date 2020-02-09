class Contact {
  final String name;
  final String email;
  final String phone;

  Contact.fromJson(Map<String, dynamic> jsonMap)
      : this.name = jsonMap['name'],
        this.email = jsonMap['email'],
        this.phone = jsonMap['phone'];
}
