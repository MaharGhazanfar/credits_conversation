import 'package:credit_and_conversation/models/models.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppChangeNotifierProviders {
  static Widget getProviders() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelSignUpPage>(
            create: (context) => ModelSignUpPage()),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme(),
        title: 'Credits and Conversation',
        routes: {
          '/': (context) => const SplashScreen(),
          '/SignInPage': (context) => const LoginPage(),
          '/SignUpPage': (context) => const SignUpPage(),
        },
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
