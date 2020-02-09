import 'package:email_app/controller/managers/message_form_manager.dart';
import 'package:email_app/controller/provider/provider.dart';
import 'package:email_app/model/message.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MessageFormManager manager = Provider.of(context).fetch(MessageFormManager);

    return Scaffold(
      appBar: AppBar(
        title: Text('Compose New Message'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: StreamBuilder<String>(
                  stream: manager.email$,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: (value) {
                        manager.inEmail.add(value);
                      },
                      // onChanged: manager.inEmail.add,
                      decoration: InputDecoration(
                        labelText: 'TO',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        errorText: snapshot.error,
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: StreamBuilder<String>(
                    stream: manager.subject$,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: manager.inSubject.add,
                        decoration: InputDecoration(
                          labelText: 'SUBJECT',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          errorText: snapshot.error,
                        ),
                      );
                    }),
              ),
              Divider(color: Colors.grey),
              ListTile(
                title: TextField(
                  onChanged: (value) {
                    manager.inBody.add(value);
                  },
                  maxLines: 9,
                  decoration: InputDecoration(
                    labelText: 'BODY',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: StreamBuilder<Object>(
                    stream: manager.isFormValid$,
                    builder: (context, snapshot) {
                      return RaisedButton(
                        child: Text('SEND'),
                        onPressed: () {
                          if (snapshot.hasData) {
                            Message message = manager.submit();
                            Navigator.of(context).pop(message);
                          }
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
