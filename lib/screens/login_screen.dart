import 'package:flash_chatter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_chatter/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late User loggedInUser;
  bool showSpinner = false;
  final _auth = FirebaseAuth
      .instance; //we are creating this variable to intialize and use it in the folowing places.
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    )),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: ktextFieldDecoration.copyWith(
                        hintText: 'Enter your E-Mail')),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: ktextFieldDecoration.copyWith(
                      hintText: 'Enter the pasword'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    title: 'Login',
                    color: const Color.fromARGB(255, 0, 0, 0),
                    onPressed1: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final User = _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        Navigator.pushReplacementNamed(context, ChatScreen.id);
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
