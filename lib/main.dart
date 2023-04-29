import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MaterialApp(
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
                  SizedBox(
                    height: screenSize.height,
                    width: screenSize.width,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => const LoginPage(),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20.0,
                            fontFamily: 'PoltawaskiNowy',
                          ),
                        ),
                      ),
                      const InkWell(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20.0,
                            fontFamily: 'PoltawaskiNowy',
                          ),
                        ),
                      ),
                    ],
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

// void returnLoginPage () {
//   if () {

//   }
// }

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
    return ClipRect(
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
    );
  }
}

// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
