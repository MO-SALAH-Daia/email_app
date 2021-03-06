import 'package:email_app/controller/managers/contact_manager.dart';
// import 'package:email_app/controller/overseer/overseer.dart';
import 'package:email_app/controller/provider/provider.dart';
import 'package:email_app/view/widgets/contact_list_builder.dart';
import 'package:email_app/model/contact.dart';
import 'package:flutter/material.dart';

class ContactSearchDelegate extends SearchDelegate {
  final manager;

  ContactSearchDelegate({this.manager});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // ContactManager manager =
    //     Provider.of<Overseer>(context).fetch(ContactManager);

    // ContactManager manager = Provider.of(context).fetch(ContactManager);

    // if (query.length < 3) {
    //   return Center(
    //     child: Text('Type at least 3 letters to search.'),
    //   );
    // }

    // manager.inFilter.add(query);

    // return ContactListBuilder(
    //   // stream: manager.browse$(query: query),
    //   stream: manager.browse$,
    //   builder: (context, contacts) {
    //     return ListView.separated(
    //       itemCount: contacts?.length ?? 0,
    //       separatorBuilder: (BuildContext context, int index) {
    //         return Divider(
    //           color: Colors.grey,
    //         );
    //       },
    //       itemBuilder: (BuildContext context, int index) {
    //         Contact _contact = contacts[index];

    //         return ListTile(
    //           title: Text(_contact.name),
    //           subtitle: Text(_contact.email),
    //           leading: CircleAvatar(),
    //         );
    //       },
    //     );
    //   },
    // );
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return Container();
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    manager.inFilter.add(query);

    return ContactListBuilder(
      // stream: manager.browse$(query: query),
      stream: manager.browse$,
      builder: (context, contacts) {
        return ListView.separated(
          itemCount: contacts?.length ?? 0,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.grey,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            Contact _contact = contacts[index];

            return ListTile(
              title: Text(_contact.name),
              subtitle: Text(_contact.email),
              leading: CircleAvatar(),
            );
          },
        );
      },
    );
  }
}
