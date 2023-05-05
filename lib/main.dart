import 'package:flutter/material.dart';
import 'package:modern_login_page/views/sign_up.dart';
import 'package:modern_login_page/views/log_in.dart';

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
            fontFamily: 'PoltawaskiNowy',
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
                            color: const Color.fromARGB(223, 244, 67, 54),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // _LoginPageState().myFocusNode.requestFocus();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignInPage()),
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
                              onTap: () {
                                // _LoginPageState().myFocusNode.requestFocus();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LogInPage()),
                                );
                              },
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
