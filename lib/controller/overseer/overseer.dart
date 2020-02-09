import 'package:email_app/controller/managers/Manager.dart';
import 'package:email_app/controller/managers/contact_manager.dart';
import 'package:email_app/controller/managers/counter_manager.dart';
import 'package:email_app/controller/managers/message_form_manager.dart';

class Overseer {
  Map<dynamic, Manager> repository = {};
  Map<dynamic, Function> _factories = {
    ContactManager: () => ContactManager(),
    CounterManager: () => CounterManager(),
    MessageFormManager: () => MessageFormManager()
  };

  static final _singleton = Overseer._internal();

  Overseer._internal();

  factory Overseer() => _singleton;

  _summon(name) => repository[name] = _factories[name]();

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) =>
      repository.containsKey(name) ? repository[name] : _summon(name);

  release(name) {
    Manager manager = repository[name];
    manager.dispose();
    repository.remove(name);
  }
}
