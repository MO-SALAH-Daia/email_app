import 'package:flutter/material.dart';

class MessageDetails extends StatelessWidget {
  final String subject;
  final String body;

  const MessageDetails({Key key, @required this.subject, @required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text(body),
      ),
    );
  }
}
