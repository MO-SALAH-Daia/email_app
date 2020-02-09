import 'package:email_app/controller/managers/contact_manager.dart';
// import 'package:email_app/controller/overseer/overseer.dart';
import 'package:email_app/controller/provider/provider.dart';
import 'package:email_app/view/widgets/observer.dart';
import 'package:flutter/material.dart';

// class ContactCounter extends StatelessWidget {
//   const ContactCounter({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // ContactManager manager =
//     //     Provider.of<Overseer>(context).fetch(ContactManager);

//     ContactManager manager = Provider.of(context).fetch(ContactManager);

//     return StreamBuilder<int>(
//       stream: manager.count$,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         return Text(
//           '${snapshot.data ?? 0}',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         );
//       },
//     );
//   }
// }

class ContactCounter extends StatelessWidget {
  const ContactCounter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ContactManager manager =
    //     Provider.of<Overseer>(context).fetch(ContactManager);

    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return Observer<int>(
      stream: manager.count$,
      onSuccess: (BuildContext context, data) {
        return Chip(
          label: Text(
            '${data ?? 0}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
        );
      },
    );
  }
}
