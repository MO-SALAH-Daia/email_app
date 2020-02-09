import 'package:email_app/controller/managers/counter_manager.dart';
import 'package:email_app/controller/provider/provider.dart';
import 'package:email_app/view/widgets/observer.dart';
import 'package:flutter/material.dart';

// class Counter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     CounterManager manager = Provider.of(context).fetch(CounterManager);

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(Icons.calendar_today, size: 120),
//           StreamBuilder<int>(
//             stream: manager.counter$,
//             initialData: 0,
//             builder: (context, snapshot) {
//               return Text(
//                 'Calendar: ${snapshot.data}',
//                 style: TextStyle(fontSize: 35),
//               );
//             }
//           ),
//         ],
//       ),
//     );
//   }
// }

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.calendar_today, size: 120),
          Observer<int>(
            stream: manager.counter$,
            onSuccess: (context, data) {
              return Text(
                'Calendar: $data',
                style: TextStyle(fontSize: 35),
              );
            },
          ),
        ],
      ),
    );
  }
}
