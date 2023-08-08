import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sip/cubits/auth/auth_cubit.dart';
import 'package:sip/utils/app_lifectyle_observer.dart';

class DefaultScreen extends StatefulWidget {
  final Widget child;

  const DefaultScreen({Key? key, required this.child}) : super(key: key);

  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  final AppLifecycleObserver _appLifecycleObserver = AppLifecycleObserver();
  final FocusNode focusNode = FocusNode();

  String? _token;

  void onTrackUser({required AuthCubitState state}) {
    _appLifecycleObserver.trackUserActivity(
      context: context,
    );

    if (state.token == null && !state.isLogout) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).requestFocus(focusNode);

    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        return KeyboardListener(
          focusNode: focusNode,
          onKeyEvent: (KeyEvent event) {
            if (event is KeyDownEvent) {
              // debugPrint(state.token);
              onTrackUser(
                state: state,
              );
            }
          },
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: () => onTrackUser(
              state: state,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  // Mobile layout
                  return widget.child;
                } else {
                  // Larger screen layout
                  return LargeScreenLayout(child: widget.child);
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
