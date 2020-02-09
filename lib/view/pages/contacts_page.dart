// import 'package:email_app/controller/overseer/overseer.dart';
import 'package:email_app/controller/managers/contact_manager.dart';
import 'package:email_app/controller/provider/provider.dart';
import 'package:email_app/view/pages/contact_search_delegate.dart';
import 'package:email_app/view/widgets/app_drawer.dart';
import 'package:email_app/view/widgets/contact_counter.dart';
import 'package:email_app/view/widgets/contact_list_builder.dart';
import 'package:email_app/model/contact.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ContactManager manager =
    //     Provider.of<Overseer>(context).fetch(ContactManager);

    ContactManager manager = Provider.of(context).fetch(ContactManager);
    manager.inFilter.add('');

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ContactCounter(),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ContactSearchDelegate()
                  // manager: manager),
                  );
            },
          ),
        ],
      ),
      body: ContactListBuilder(
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
      ),
    );
  }
}
