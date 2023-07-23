import 'dart:async';

class MainMenuBloc {
  String welcome = "ETALASE PANGAN";

  final _counterController = StreamController<String>();

  Stream<String> get welcomeStream => _counterController.stream;
  String get currentWelcome => welcome;

  void onChangeWelcome(value) {
    welcome = value;
    _counterController.sink.add(welcome);
  }

  void dispose() {
    _counterController.close();
  }
}
