import 'package:flutter/material.dart';
import 'package:sip/modules/auth/login_screen.dart';
import 'package:sip/modules/main_menu/view/main_menu_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      'login': (_) => LoginScreen(),
      'main': (_) => MainMenuScreen(),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}
