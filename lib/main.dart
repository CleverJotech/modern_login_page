import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Clever App",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(202, 235, 35, 35),
        title: const Center(
            child: Text(
          'Clever Modern Login Page',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            fontFamily: 'Lobster',
          ),
        )),
      ),
      body: ColoredBox(
        color: const Color.fromARGB(255, 255, 235, 224),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PreferredSize(
              preferredSize:
                  Size(screenSize.width / 0.5, screenSize.height / 0.5),
              child: const Image(image: AssetImage('assets/_image_modern.jpg')),
            ),
            Center(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: screenSize.height / 1.3,
                      width: screenSize.width / 2,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: screenSize.width / 7,
                        // ),
                        Container(
                          width: 99.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(202, 244, 67, 54),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                _LoginPageState().myFocusNode.requestFocus();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              child: const Text(
                                'Sign Up',
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
                          width: screenSize.width / 9,
                        ),
                        Container(
                          width: 99.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(164, 237, 166, 52),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () => const LoginPage(),
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0,
                                  fontFamily: 'PoltawaskiNowy',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _gmailTextController;
  late TextEditingController _passTextController;
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
    return Scaffold(
      body: ColoredBox(
        color: const Color.fromARGB(255, 255, 235, 224),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PreferredSize(
              preferredSize:
                  Size(screenSize.width / 0.5, screenSize.height / 0.5),
              child: const Image(image: AssetImage('assets/_image_modern.jpg')),
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
                              keyboardType: TextInputType.visiblePassword,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2.0,
                                    style: BorderStyle.solid,
                                    color: Color.fromARGB(255, 200, 200, 200),
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
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenSize.width / 2,
                            height: screenSize.height / 12,
                          ),
                          const Text(
                            'Signing in with gmail',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
  }
}

// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
