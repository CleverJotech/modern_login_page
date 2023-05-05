import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modern_login_page/firebase_options.dart';
import 'package:modern_login_page/views/snap_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _gmailTextController;
  late final TextEditingController _passTextController;
  late FocusNode myFocusNode;

  String inputFromUser = "";
  String passFromUser = "";

  @override
  void initState() {
    _gmailTextController = TextEditingController();
    _passTextController = TextEditingController();
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _gmailTextController.dispose();
    _passTextController.dispose();
    myFocusNode = FocusNode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: ColoredBox(
                color: const Color.fromARGB(255, 255, 235, 224),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    PreferredSize(
                      preferredSize:
                          Size(screenSize.width / 0.5, screenSize.height / 0.5),
                      child: const Image(
                          image: AssetImage('assets/_image_modern.jpg')),
                    ),
                    ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          // width: screenSize.width / 2,
                          // height: screenSize.height / 1.5,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Container(
                              width: screenSize.width / 1.5,
                              height: screenSize.height / 2.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: screenSize.width / 10,
                                    height: screenSize.height / 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: TextField(
                                      controller: _gmailTextController,
                                      autofocus: true,
                                      focusNode: myFocusNode,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        labelText: 'Gmail',
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter gmail here',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 7,
                                    height: screenSize.height / 120,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: TextField(
                                      controller: _passTextController,
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: const InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                            color: Color.fromARGB(
                                                255, 200, 200, 200),
                                          ),
                                        ),
                                        hintText: 'Enter password here',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 2,
                                    height: screenSize.height / 25,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final userEmail =
                                          _gmailTextController.text;
                                      final userPassword =
                                          _passTextController.text;
                                      final userCredential = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                        email: userEmail,
                                        password: userPassword,
                                      );
                                      print(userCredential);
                                    },
                                    child: Container(
                                      width: screenSize.width / 2.5,
                                      height: screenSize.height / 15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red[400],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                            fontFamily: 'PoltawaskiNowy',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 2,
                                    height: screenSize.height / 14,
                                  ),
                                  const Text(
                                    'Signing in with gmail',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.0,
                                      fontFamily: 'PoltawaskiNowy',
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 10,
                                    height: screenSize.height / 150,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const SnapshotErrorPage();
          } else {
            return const SpinKitWaveSpinner(
              color: Color.fromARGB(255, 244, 77, 74),
            );
          }
          // default:
          //   return const SpinKitWaveSpinner(
          //     color: Color.fromARGB(255, 244, 77, 74),
          //   );
        });
  }
}
