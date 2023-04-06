import 'package:credit_and_conversation/model_classes/model_signup_page.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var baseTheme = ThemeData(
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black87),
      scaffoldBackgroundColor: Colors.black87,
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        headlineMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        headlineLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        titleSmall: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(
        color: goldenColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: goldenColor,
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return ChangeNotifierProvider(
      create: (context) => ModelSignUpPage(),
      builder: (context, child) => MaterialApp(
        title: 'Credits and Conversation',
        routes: {
          '/': (context) => const SplashScreen(),
          '/SignInPage': (context) => const LoginPage(),
          '/SignUpPage': (context) => const SignUpPage(),
        },
        initialRoute: '/',
        theme: baseTheme.copyWith(
            textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme)),
        // ThemeData(
        //   primaryColor: Colors.white,
        //   //appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        //   scaffoldBackgroundColor: Colors.black87,
        //   textTheme: const TextTheme(
        //     bodySmall: TextStyle(
        //       color: Colors.white,
        //       fontSize: 14,
        //     ),
        //     bodyMedium: TextStyle(
        //       color: Colors.white,
        //       fontSize: 16,
        //     ),
        //     bodyLarge: TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //     ),
        //     headlineSmall: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 22,
        //     ),
        //     headlineMedium: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 24,
        //     ),
        //     headlineLarge: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 24,
        //     ),
        //     titleSmall: TextStyle(
        //       color: Colors.white,
        //       fontSize: 16,
        //     ),
        //     titleMedium: TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //     ),
        //     titleLarge: TextStyle(
        //       color: Colors.white,
        //       fontSize: 20,
        //     ),
        //   ),
        //   iconTheme: IconThemeData(color: goldenColor, size: 35),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: goldenColor,
        //       textStyle: const TextStyle(
        //           color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
