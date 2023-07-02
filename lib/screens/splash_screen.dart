import 'package:credit_and_conversation/constants/constants.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

late Size mq;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (mounted) {
        Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }

                  if (snapshot.hasData) {
                    return DiscoveryPage();
                  }

                  // If the user is not logged in, display the LoginPage
                  // or any other sign-in page you have created.
                  return LoginPage();
                },
              ),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SizedBox(
      width: mq.width,
      height: mq.height,
      child: Image.asset(AppImages.splashImg),
    );
  }
}
