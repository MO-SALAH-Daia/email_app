import 'package:email_app/model/message.dart';
import 'package:email_app/view/pages/message_compose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages;

  const ComposeButton({Key key, this.messages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (BuildContext context) => MessageCompose(),
          ),
        )
            .then((value) {
          print('$value');
          if (value != null) {
            messages.add(value);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Your message has been sent with'),
                backgroundColor: Colors.green,
              ),
            );
          }
        });
      },
    );
  }
}
