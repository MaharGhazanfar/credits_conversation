import 'package:credit_and_conversation/models/signup_model.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ModelSignUpPage>(
          create: (context) => ModelSignUpPage()),
    ],
    child: MaterialApp(
      theme: appTheme(),
      title: 'Credits and Conversation',
      routes: {
        '/': (context) => const SplashScreen(),
        '/SignInPage': (context) => const LoginPage(),
        '/SignUpPage': (context) => const SignUpPage(),
      },
      initialRoute: '/',
      // theme: baseTheme.copyWith(
      //     textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme)),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
