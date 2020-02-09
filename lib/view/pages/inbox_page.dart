import 'package:email_app/view/widgets/app_drawer.dart';
import 'package:email_app/view/widgets/compose_button.dart';
import 'package:email_app/view/widgets/message_list.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Inbox'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {},
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Important'),
              ),
              Tab(
                child: Text('Other'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MessageListPage(
              status: 'important',
            ),
            MessageListPage(
              status: 'other',
            ),
          ],
        ),
        floatingActionButton: ComposeButton(
          messages: [],
        ),
      ),
    );
  }
}
