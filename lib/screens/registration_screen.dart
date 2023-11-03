
import 'package:flash_chatter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_chatter/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  const RegistrationScreen({super.key});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth
      .instance; //using this for authenticating the users those who register
  late String email;
  late String password;
  User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType
                      .emailAddress, //to make the user make it easy to enter the at symbol inside the text field
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: ktextFieldDecoration.copyWith(
                      hintText: 'Enter your E-mail id ')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true, //to make the password look blur
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: ktextFieldDecoration.copyWith(
                      hintText: 'Enter your password')),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Register',
                  color: Colors.blueGrey,
                  onPressed1: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password:
                              password); //we are using async is to be sure that we are create a proper authentication
                      Navigator.pushNamed(context, ChatScreen.id);
                      setState(() {
                        showSpinner = false;
                      }); //if this user is authenticate dhten it ets saved and then it is sent chat screen
                                        } //try
                    catch (e) {
                      print(e);
                    } //catch
                  } //async
                  ) //creating a empty call back here)
            ],
          ),
        ),
      ),
    );
  }
}
