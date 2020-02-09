import 'package:email_app/controller/managers/Manager.dart';
import 'package:rxdart/rxdart.dart';

import 'package:email_app/model/contact.dart';
import 'package:email_app/service/contact_service.dart';

class ContactManager implements Manager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final BehaviorSubject<int> _countSubject = BehaviorSubject<int>();
  final PublishSubject<List<Contact>> _collectionSubject =
      PublishSubject<List<Contact>>();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;

  // Stream<List<Contact>> get contactListNow async* {
  //   yield await ContactService.browse();
  // }

  // // same as the function in the above
  // Stream<List<Contact>> get contactListView {
  //   return Stream.fromFuture(ContactService.browse());
  // }

  // Stream<List<Contact>> browse$({String query}) {
  //   return Stream.fromFuture(ContactService.browse(query: query));
  // }

  Stream<List<Contact>> get browse$ => _collectionSubject.stream;

  ContactManager() {
    _filterSubject
        .debounceTime(Duration(milliseconds: 500))
        .switchMap((filter) async* {
      yield await ContactService.browse(filter: filter);
    }).listen((contacts) async {
      _collectionSubject.add(contacts);
    });
    // browse$().listen((list) => _contactCount.add(list.length));
    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  @override
  void dispose() {
    _countSubject.close();
    _filterSubject.close();
  }
}
