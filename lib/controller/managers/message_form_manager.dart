import 'dart:async';

import 'package:email_app/controller/managers/Manager.dart';
import 'package:email_app/model/message.dart';
import 'package:email_app/validation.dart';
import 'package:rxdart/rxdart.dart';

class MessageFormManager with Validation implements Manager {
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  final _subject = BehaviorSubject<String>();
  Stream<String> get subject$ => _subject.stream.transform(validateSubject);
  Sink<String> get inSubject => _subject.sink;

  final _body = BehaviorSubject<String>();
  Stream<String> get body$ => _body.stream;
  Sink<String> get inBody => _body.sink;

  Stream<bool> get isFormValid$ =>
      Rx.combineLatest([email$, subject$, body$], (values) => true);

  Message submit() {
    String subject = _subject.value;
    String body = _body.value;

    return Message(subject, body);
  }

  void dispose() {
    _email.close();
    _subject.close();
    _body.close();
  }
}
