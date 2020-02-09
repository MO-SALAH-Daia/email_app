import 'package:email_app/view/widgets/app_drawer.dart';
import 'package:email_app/view/widgets/counter.dart';
import 'package:email_app/view/widgets/fab_button.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Counter(),
      floatingActionButton: FabButton(),
    );
  }
}
