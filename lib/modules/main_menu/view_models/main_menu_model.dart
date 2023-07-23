import 'package:sip/stores/main_menu_bloc.dart';

class MainMenuModdel {
  final MainMenuBloc mainMenuBloc = MainMenuBloc();

  Stream<String> get welcomeStream => mainMenuBloc.welcomeStream;
  String get currentWelcome => mainMenuBloc.currentWelcome;

  void onChangeWelcome(value) {
    mainMenuBloc.onChangeWelcome(value);
  }
}
