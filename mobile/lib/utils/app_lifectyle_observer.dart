import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/cubits/auth/auth_cubit.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  static Timer? _timer;
  static const _autoLogoutTimer = 5;

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
  void trackUserActivity({required BuildContext context}) async {
    // debugPrint('User Activity Detected, user login = ${isLogin.toString()}');
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    // debugPrint("token = ${authCubit.state.token.toString()}");
    // debugPrint("${authCubit.state.isLogout}");
    if (authCubit.state.token == null || authCubit.state.token == "") {
      // if (authCubit.state.isLogout == false) {
      //   // debugPrint("login");
      //   Navigator.pushNamed(context, "login");
      // }

      // authCubit.onLogout();
    } else {
      // debugPrint("start new timer");

      startNewTimer(
        isLogin: true,
        context: context,
      );
    }
  }

  void startNewTimer({required BuildContext context, required bool isLogin}) {
    stopTimer();
    if (isLogin) {
      _timer = Timer.periodic(const Duration(minutes: _autoLogoutTimer), (_) {
        timedOut(
          isLogin: isLogin,
          context: context,
        );
      });
    }
  }

  void stopTimer() {
    if (_timer != null || (_timer?.isActive != null && _timer!.isActive)) {
      _timer?.cancel();
    }
  }

  Future<void> timedOut(
      {required BuildContext context, required bool isLogin}) async {
    stopTimer();
    if (isLogin) {
      // _authService.logoutUser(reason: 'auto-logout');
      AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

      authCubit.onLogout();

      Navigator.pushNamed(context, "login");
    }
  }
}
