import 'package:email_app/controller/overseer/overseer.dart';
import 'package:email_app/controller/provider/provider.dart';
import 'package:email_app/view/pages/app.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // Provider<Overseer>
        Provider(
      data: Overseer(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.red,
        ),
        home: App(),
      ),
    );
  }
}
