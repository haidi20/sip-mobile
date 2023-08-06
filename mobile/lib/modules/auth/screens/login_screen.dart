import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip/blocs/auth/auth_bloc.dart';
import 'package:sip/constants.dart';
import 'package:sip/layouts/master.dart';
import 'package:sip/modules/auth/widgets/build_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDarkMode = false;
  bool checkedValue = false;
  String? token;
  final _username = GlobalKey<FormState>();
  final _password = GlobalKey<FormState>();

  List textfieldsStrings = [
    "", //firstName
    "", //password
  ];

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double paddingRight = size.width * paddingRightLeftGenerale;
    double paddingLeft = size.width * paddingRightLeftGenerale;
    double top = size.height * 0.1;

    return Master(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: paddingLeft,
                    right: paddingRight,
                  ),
                  // padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: top),
                        child: Align(
                          child: Text(
                            '',
                            style: GoogleFonts.poppins(
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xff1D1617),
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.015),
                        child: Align(
                          child: Text(
                            'Selamat Datang',
                            style: GoogleFonts.poppins(
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xff1D1617),
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      buildTextField(
                        hintText: "Username",
                        icon: Icons.person_outlined,
                        password: false,
                        size: size,
                        validator: (valuename) {
                          if (valuename.length <= 2) {
                            buildSnackError(
                              'Invalid name',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                        },
                        key: _username,
                        stringToEdit: 0,
                        isDarkMode: isDarkMode,
                      ),
                      Form(
                        child: buildTextField(
                          hintText: "Passsword",
                          icon: Icons.lock_outline,
                          password: true,
                          size: size,
                          validator: (valuepassword) {
                            if (valuepassword.length < 6) {
                              buildSnackError(
                                'Invalid password',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;
                          },
                          key: _password,
                          stringToEdit: 1,
                          isDarkMode: isDarkMode,
                        ),
                      ),
                      SizedBox(
                        height: top,
                      ),
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          // debugPrint(state.token);
                          setState(() {
                            isLoading = state.isLoading;
                          });

                          if (!state.isLoading) {
                            if (state.token != null &&
                                state.token!.isNotEmpty) {
                              // debugPrint("token = ${state.token}");
                              Navigator.pushNamed(context, "main");
                            } else {
                              showLoginWarning(context);
                            }
                          }
                        },
                        child: FractionallySizedBox(
                          widthFactor:
                              1, // Set width to 100% of available width
                          heightFactor: null,
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(0),
                            child: buildElevatedButton(
                              isLoading: isLoading,
                              child: isLoading
                                  ? const Text('loading...')
                                  : const Text('Login'),
                              onPressed: () async {
                                AuthBloc authBloc =
                                    BlocProvider.of<AuthBloc>(context);

                                authBloc.add(
                                  AuthLogin(
                                    username: textfieldsStrings[0].toString(),
                                    password: textfieldsStrings[1].toString(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;
  Widget buildTextField({
    required String hintText,
    required IconData icon,
    required bool password,
    required size,
    required FormFieldValidator validator,
    required Key key,
    required int stringToEdit,
    required bool isDarkMode,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            style: TextStyle(
                color: isDarkMode ? const Color(0xffADA4A5) : Colors.black),
            onChanged: (value) {
              setState(() {
                textfieldsStrings[stringToEdit] = value;
              });
            },
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: password ? !pwVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.005,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff7B6F72),
                ),
              ),
              suffixIcon: password
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            pwVisible = !pwVisible;
                          });
                        },
                        child: pwVisible
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff7B6F72),
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff7B6F72),
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  void showLoginWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Perhatian'),
          content: const Text('Maaf, anda tidak punya akses.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
