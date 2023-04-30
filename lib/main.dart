import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart';
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
        backgroundColor: const Color.fromARGB(255, 235, 35, 35),
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
                            color: Colors.red[500],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
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
                          width: screenSize.width / 5,
                        ),
                        Container(
                          width: 99.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.red[500],
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
  TextEditingController _textcontroller = TextEditingController();
  String inputFromUser = "";
  String passFromUser = "";

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
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: const Center(
                    child: Text('meee'),
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
