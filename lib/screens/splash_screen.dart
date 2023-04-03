import 'package:credit_and_conversation/screens/screens.dart';
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
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: LoginPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SizedBox(
      width: mq.width,
      height: mq.height,
      child: Image.asset('assets/splash_image.png'),
    );
  }
}
