import 'package:flutter/material.dart';
import 'package:sip/modules/auth/login_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => LoginScreen(),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}
