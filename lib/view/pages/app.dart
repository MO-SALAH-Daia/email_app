import 'package:email_app/view/pages/calendar_page.dart';
import 'package:email_app/view/pages/contacts_page.dart';
import 'package:email_app/view/pages/inbox_page.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InboxPage(),
        ContactsPage(),
        CalendarPage(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Contacts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
          ),
        ],
        onTap: _onBottomNavigationBarItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBottomNavigationBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
