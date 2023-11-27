import 'package:flash_chatter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chatter/components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //if you wanted to multianmate you can import the another superclass
  late AnimationController controller1;
  late Animation animation1, animation2;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation1 = CurvedAnimation(
        parent: controller1,
        curve: Curves.easeIn); //directly it is connected to the parent
    animation2 = ColorTween(begin: Colors.blue, end: Colors.white).animate(
        controller1); //In this you have to give separate for connecting into animation

    controller1.forward();
    animation1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller1.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller1.forward();
      }
    });
    controller1.addListener(() {
      setState(() {});
      print(controller1.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/logo.png',
                  height: 40.0,
                ),
                TyperAnimatedTextKit(
                  text: const ['Fire dip'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    wordSpacing: controller1.value,
                  ),
                ),
              ],
            ),
            const SizedBox(
              //this is introduced to create a space between the two box or text
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              color: Colors.blueGrey,
              onPressed1: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
                color: Colors.blueGrey,
                title: 'Register',
                onPressed1: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
