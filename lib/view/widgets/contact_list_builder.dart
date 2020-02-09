import 'package:email_app/model/contact.dart';
import 'package:email_app/view/widgets/observer.dart';
import 'package:flutter/material.dart';

// class ContactListBuilder extends StatelessWidget {
//   final Stream<List<Contact>> stream;
//   final Function builder;

//   const ContactListBuilder({Key key, this.stream, this.builder})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Contact>>(
//       stream: stream,
//       builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//           case ConnectionState.waiting:
//           case ConnectionState.active:
//             return LinearProgressIndicator();
//           case ConnectionState.done:
//             if (snapshot.hasError) {
//               return Text('There was an erorre: ${snapshot.error}');
//             }

//             List<Contact> contacts = snapshot.data;

//             return builder(context, contacts);
//         }
//       },
//     );
//   }
// }

class ContactListBuilder extends StatelessWidget {
  final Stream<List<Contact>> stream;
  final Function builder;

  const ContactListBuilder({Key key, this.stream, this.builder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      onSuccess: (BuildContext context, List<Contact> data) =>
          builder(context, data),
      onWaiting: (context) => LinearProgressIndicator(),
    );
  }
}
