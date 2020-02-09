import 'dart:async';
import 'dart:convert';
import 'package:email_app/model/contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  // static String url = 'https://jsonplaceholder.typicode.com/users';
  static String _url = 'http://fip.zaiste.net/contacts';

  static Future<List<Contact>> browse({filter}) async {
    // http.Response response = await http.get(url);
    http.Response response = await http.get('$_url?q=$filter');

    // await Future.delayed(Duration(milliseconds: 100));

    String content = response.body;
    List collection = jsonDecode(content);

    // List<Contact> _contacts =
    //     collection.map((e) => Contact.fromJson(e)).toList();

    Iterable<Contact> _contacts = collection.map((_) => Contact.fromJson(_));

    // if (filter != null && filter.isNotEmpty) {
    //   _contacts = _contacts
    //       .where((contact) => contact.name.toLowerCase().contains(filter));
    // }

    return _contacts.toList();
  }
}
