import 'dart:convert';
import 'package:http/http.dart' as http;

class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  Message.fromJson(Map<String, dynamic> jsonMap)
      : subject = jsonMap['subject'],
        body = jsonMap['body'];

  static Future<List<Message>> browse({status = 'important'}) async {
    String url = status == 'important'
        ? 'http://www.mocky.io/v2/5cc3d8b83400006500765461'
        : 'http://www.mocky.io/v2/5cbecf6030000053059ce2c0';

    http.Response response = await http.get(url);

    // await Future.delayed(Duration(milliseconds: 100));

    String content = response.body;
    List collection = jsonDecode(content);
    List<Message> _message =
        collection.map((e) => Message.fromJson(e)).toList();

    return _message;
  }
}

// import 'package:flutter/services.dart';
// get data from assets
// String content = await rootBundle.loadString('data/message.json');
