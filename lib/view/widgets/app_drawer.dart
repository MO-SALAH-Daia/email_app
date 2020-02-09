import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('www@email.com'),
            accountName: Text('Mohammad'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjWn2vvi-XrBuTcKxDQA-G2SSLhAWOgl19f7fQyvj525FfbEcvWw"),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text('Add  account...'),
                        );
                      });
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text('Inbox'),
            trailing: Chip(
              label: Text(
                '11',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue[100],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text('Draft'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.archive),
            title: Text('Archive'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.paperPlane),
            title: Text('Sent'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trash),
            title: Text('Trash'),
          ),
          Divider(),
          Expanded(
            child: Align(
              //Alignment.bottomLeft
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.cog),
                title: Text('Setting'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
