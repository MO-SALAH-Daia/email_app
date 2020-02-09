import 'package:email_app/controller/managers/counter_manager.dart';
import 'package:email_app/controller/provider/provider.dart';
import 'package:flutter/material.dart';

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: manager.increment,
    );
  }
}
