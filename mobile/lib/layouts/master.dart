import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/blocs/auth/auth_bloc.dart';
import 'package:sip/utils/app_lifectyle_observer.dart';

class Master extends StatelessWidget {
  Master({Key? key, required this.child}) : super(key: key);

  final Widget child;
  final AppLifecycleObserver _appLifecycleObserver = AppLifecycleObserver();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).requestFocus(focusNode);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        //
      },
      builder: (context, state) {
        return KeyboardListener(
          focusNode: focusNode,
          onKeyEvent: (KeyEvent event) {
            if (event is KeyDownEvent) {
              _appLifecycleObserver.trackUserActivity(
                isLogin: state.token != null ? true : false,
              );
            }
          },
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: () {
              _appLifecycleObserver.trackUserActivity(
                isLogin: state.token != null ? true : false,
              );
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  // Mobile layout
                  return child;
                } else {
                  // Larger screen layout
                  return LargeScreenLayout(child: child);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class LargeScreenLayout extends StatelessWidget {
  const LargeScreenLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 40,
          child: Container(
              // Add any additional widgets or effects you want for the left part
              // color: Colors.blue,
              ),
        ),
        Expanded(
          flex: 40,
          child: child,
        ),
        Expanded(
          flex: 40,
          child: Container(
              // Add any additional widgets or effects you want for the right part
              // color: Colors.blue,
              ),
        ),
      ],
    );
  }
}
