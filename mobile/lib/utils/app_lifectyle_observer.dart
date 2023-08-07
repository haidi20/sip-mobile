import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/auth/auth_bloc.dart';
import 'package:sip/blocs/blocs.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  String? _token;
  static Timer? _timer;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      // Aplikasi berpindah ke status aktif (dalam fokus)
      debugPrint('App is in foreground');
    } else if (state == AppLifecycleState.paused) {
      // Aplikasi berpindah ke status tidak aktif (tidak dalam fokus)
      debugPrint('App is in background');
    }
  }

  /// Track user activity and reset timer
  void trackUserActivity({required bool isLogin}) async {
    // debugPrint('User Activity Detected, user login = ${isLogin.toString()}');
    // if (_token != null && _timer != null) {
    //   debugPrint("start new timer");
    //   // startNewTimer();
    // }
  }
}
